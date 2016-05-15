from django.shortcuts import render, get_object_or_404
from django.contrib.auth.models import User
from core.models import UserRole, UserProfile, IssueStatus, Issue
from core.forms import RegistrationForm, GrievanceForm
from django.http import Http404
from components.geo import googlegeo

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
        try:
            update = Issue.objects.filter(issue_id=issue).get()
            update.status = IssueStatus.objects.filter(id=status).get()
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
    return render(request, 'grievance/review.html', {'grievance': grievance, 'statuses': IssueStatus.objects.all(), 'message': message, 'messageStatus': messageStatus})
