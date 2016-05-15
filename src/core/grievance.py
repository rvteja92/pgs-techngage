from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User
from core.models import UserRole, UserProfile, IssueStatus, Issue, Department
from core.forms import RegistrationForm, GrievanceForm, DepartmentForm
from django.http import Http404, HttpResponseRedirect
from components.geo import googlegeo
from django.core.urlresolvers import reverse

import traceback

def add(request):
    if request.method == 'POST':
        print('We got a POST request for grievance')
        form = GrievanceForm(request.POST)
        if form.is_valid():

            new_grievance = form.save(commit=False)
            #set status to "new"
            new_grievance.status =  IssueStatus.objects.filter(id=1).get()
            if new_grievance.latitude and new_grievance.longitude:
                new_grievance.geo_address = googlegeo.getAddressObject(new_grievance.latitude, new_grievance.longitude)
            #TODO set user to "current user"

            try:
                #save the grievance
                new_grievance.save()
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
                    'content': 'Your grievance has been registrated successfully!! Your grievance id is : ' + str(new_grievance.issue_id)
                }
            return render(request, 'core/message.html', context)
        else:
            print('Form is invalid')
    else:
        form = GrievanceForm()
    return render(request, 'grievance/add.html', {'form': form})

def all(request):
    if request.method == 'GET':
        page_no = int(request.GET.get('page', '1'))
        if page_no < 1:
            raise Http404()
        return render(request, 'grievance/all.html', {'all_issues': Issue.objects.all()[(page_no-1)*10:(page_no*10)]})
    else:
        raise Http404()

def view(request, grievance_id):
    if request.method == 'GET':
        print('Grievance ID: ' + grievance_id)
        grievance = get_object_or_404(Issue, issue_id=grievance_id)
        if grievance.latitude and grievance.longitude and not grievance.geo_address:
            grievance.geo_address = googlegeo.getAddressObject(grievance.latitude, grievance.longitude)
            try:
                grievance.save()
            except Exception as e:
                #TODO log that address object could not be stored instead of printing
                traceback.print_exc()
        return render(request, 'grievance/view.html', {'grievance': grievance})
    else:
        raise Http404()

def review(request, grievance_id):
    message = ''
    messageStatus = ''
    if request.method == 'POST':
        status = request.POST['status_id']
        issue = request.POST['issue_id']
        category = request.POST['category_id']
        try:
            update = Issue.objects.filter(issue_id=issue).get()
            update.status = IssueStatus.objects.filter(id=status).get()
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
    if grievance.latitude and grievance.longitude and not grievance.geo_address:
        try:
            grievance.geo_address = googlegeo.getAddressObject(grievance.latitude, grievance.longitude)
            grievance.save()
        except Exception as e:
            #TODO log that address object could not be stored instead of printing
            traceback.print_exc()
    return render(request, 'grievance/review.html', {'grievance': grievance, 'statuses': IssueStatus.objects.all(),
                                'departments': Department.objects.all(), 'message': message, 'messageStatus': messageStatus})

def departments(request):
    if request.method == 'GET':
        departments = Department.objects.all()
        dept_form   = DepartmentForm()
        return render(request, 'department/all.html', {'departments': departments, 'dept_form': dept_form})
    raise Http404()

def saveDepartment(request):
    print('Got into saving departments')
    if request.method == 'POST':
        form = DepartmentForm(request.POST)
        if form.is_valid():
            try:
                form.save()
                return redirect(reverse('core:dept_all'))
            except Exception as e:
                traceback.print_exc()
    raise Http404()

def dashboard(request):
    print('Here in the dashboard')
    if request.method == 'GET':
        total   = Issue.objects.count()
        resolved    = Issue.objects.filter(status=6).count()
        spam    = Issue.objects.filter(status=3).count()
        un_resolved = total - resolved - spam
        context = {
            'total': total,
            'resolved': resolved,
            'un_resolved': un_resolved,
        }
        return render(request, 'dashboard/main.html', context)
    raise Http404()
