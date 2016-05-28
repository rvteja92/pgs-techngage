from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User
from core.models import IssueStatus, Issue, Department
from core.forms import GrievanceForm, DepartmentForm
from django.http import Http404, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.core.exceptions import PermissionDenied
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage

import traceback, logging

from components.tasks import *

from rest_framework import viewsets
from .serializers import IssueSerializer
from accounts.helpers import authorization

logger = logging.getLogger(__name__)

log = open('e.log', 'a')


def add(request):
    if not request.user.is_authenticated():
        return render(request, 'core/notloggedin.html')

    if request.method == 'POST':
        print('We got a POST request for grievance')
        form = GrievanceForm(request.POST)
        if form.is_valid():

            new_grievance = form.save(commit=False)
            #set status to "new"
            new_grievance.status =  IssueStatus.objects.filter(id=1).get()

            #TODO set user to "current user"
            new_grievance.user  = request.user
            try:
                #save the grievance
                new_grievance.save()

                if new_grievance.latitude and new_grievance.longitude:
                    # All google geo tasks for Issues go into queue 'issuegeo'
                    getaddressfor.apply_async([new_grievance.issue_id,], queue = 'issuegeo')

            except Exception as e:
                context = {
                        'alert_type': 'alert-danger',
                        'content': 'Grievance registration failed!! Unable to save.'
                    }
                print("Type: " + type(new_grievance).__name__)
                traceback.print_exc()
                return render(request, 'core/message.html', context)
            context = {
                    'alert_type': 'alert-success',
                    'content': 'Your grievance has been registered successfully!! Your grievance id is : ' + str(new_grievance.issue_id)
                }
            return render(request, 'core/message.html', context)
        else:
            print('Form is invalid')
    else:
        form = GrievanceForm()
    return render(request, 'grievance/add.html', {'form': form})

def allIssues(request):
    if request.method == 'GET':
        page_no = int(request.GET.get('page', '1'))
        all_issues = Issue.objects.all().order_by('issue_id')
        paginator = Paginator(all_issues, 10)

        try:
            issues  = paginator.page(page_no)
        except PageNotAnInteger:
            issues  = paginator.page(1)
        except EmptyPage:
            issues  = paginator.page(paginator.num_pages)

        return render(request, 'grievance/all.html', {'all_issues': issues })
    else:
        raise Http404()

def view(request, grievance_id):
    if request.method == 'GET':
        print('Grievance ID: ' + grievance_id)
        grievance = get_object_or_404(Issue, issue_id=grievance_id)
        if grievance.latitude and grievance.longitude:
            getaddressfor.apply_async([grievance_id,], queue = 'issuegeo')

        return render(request, 'grievance/view.html', {'grievance': grievance})
    else:
        raise Http404()

def review(request, grievance_id):
    if authorization.isAdmin(request):
        message = ''
        messageStatus = ''
        if request.method == 'POST':
            status = request.POST['status_id']
            issue = request.POST['issue_id']
            category = request.POST['category_id']
            try:
                update = Issue.objects.filter(issue_id=issue).get()
                new_status = IssueStatus.objects.filter(id=status).get()
                if update.status != status:
                    print('Inside status tweet', file = log)
                    message = 'Your grievance with id ' + str(update.issue_id) + ' has been maked as ' + new_status.status + 'http://pgs.ravitejap.in/grievance/track/' + str(update.issue_id)
                    notifyStatus.apply_async((message, issue), queue = 'twitternotifications')
                update.status = new_status
                if int(category) > 0:
                    update.category = Department.objects.filter(dept_id=category).get()
                else:
                    update.category = None
                update.save()
                message = 'Status updated successfully.'
                messageStatus = 'alert-success'
            except Exception as e:
                #TODO log that address object could not be stored instead of printing
                traceback.print_exc()
                message = 'Status could not be updated.'
                messageStatus = 'alert-danger'
        print('Grievance ID: ' + grievance_id)
        grievance = get_object_or_404(Issue, issue_id=grievance_id)
        print(int(grievance_id), file=log)
        if grievance.latitude and grievance.longitude:
            getaddressfor.apply_async([grievance_id,], queue = 'issuegeo')

        return render(request, 'grievance/review.html', {'grievance': grievance, 'statuses': IssueStatus.objects.all(),
                                    'departments': Department.objects.all(), 'message': message, 'messageStatus': messageStatus})
    raise PermissionDenied


def departments(request):
    if request.method == 'GET':
        departments = Department.objects.all()
        details = [];
        for dept in departments:
            issues  = Issue.objects.filter(category=dept.dept_id)
            total   = issues.count()
            resolved    = issues.filter(status=5).count()
            spam    = issues.filter(status=6).count()
            un_resolved = total - resolved - spam
            details.append((dept, {
                                        'total' : total,
                                        'resolved'  : resolved,
                                        'un_resolved'   : un_resolved,
                                    }))

        if authorization.isAdmin(request):
            dept_form   = DepartmentForm()
        else:
            dept_form   = None
        return render(request, 'department/all.html', {'departments': details, 'dept_form': dept_form})
    raise Http404()

def saveDepartment(request):
    if authorization.isAdmin(request):
        if request.method == 'POST':
            form = DepartmentForm(request.POST)
            if form.is_valid():
                try:
                    form.save()
                    return redirect(reverse('core:dept_all'))
                except Exception as e:
                    traceback.print_exc()
        raise Http404()
    raise PermissionDenied

def dashboard(request):
    print('Here in the dashboard')
    if request.method == 'GET':
        total   = Issue.objects.count()
        resolved    = Issue.objects.filter(status=5).count()
        spam    = Issue.objects.filter(status=6).count()
        cant    = Issue.objects.filter(status=8).count()
        total   = total - spam - cant
        un_resolved = total - resolved
        context = {
            'total': total,
            'resolved': resolved,
            'un_resolved': un_resolved,
        }
        logger.info('Opened dashboard')
        return render(request, 'dashboard/main.html', context)
    raise Http404()

def track(request, grievance_id):
    if request.method == 'GET':
        grievance = get_object_or_404(Issue, issue_id=grievance_id)
        status  = grievance.status
        return render(request, 'grievance/track.html', { 'grievance': grievance, 'status': status })

    raise Http404()

class IssueViewSet(viewsets.ModelViewSet):
    queryset    = Issue.objects.all()
    serializer_class    = IssueSerializer
