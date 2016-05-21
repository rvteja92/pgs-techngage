from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.http.response import HttpResponseRedirect

from .models import User, UserRole
from .forms import RegistrationForm, LoginForm
import logging
from traceback import print_exc


logger = logging.getLogger(__name__)

def userregister(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)

        if form.is_valid():
            print('Form is valid')
            newuser = form.save(commit=False)
            newuser.role    = UserRole.objects.filter(roleid=3).get()

            try:
                newuser.save()
                context = {
                        'alert_type': 'alert-success',
                        'content': 'User registered successfully!!'
                    }
                return render(request, 'core/message.html', context)
            
            except Exception as e:
                logger.error(e)
                print_exc()
                context = {
                        'alert_type': 'alert-danger',
                        'content': 'Failed to register!!'
                    }
                return render(request, 'core/message.html', context)
    else:
        form = RegistrationForm()
        
    return render(request, 'accounts/signup.html', {'form' : form})


def userlogin(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            user_name = request.POST['username']
            user_password = request.POST['password']
            print('Username: ' + user_name + ', Password: ' + user_password)
            user = authenticate(username= user_name, password = user_password)
        
            if user:
                if user.is_active:
                    login(request, user)
                    #request.session.set_expiry(60)
                    return HttpResponseRedirect('/')
            else:
                context = {
                        'alert_type': 'alert-danger',
                        'content': 'Invalid request!!'
                    }
                return render(request, 'core/message.html', context)
    else:
        form = LoginForm()
        
    return render(request, 'accounts/login.html', {'form' : form})

def userlogout(request):
    logout(request)
    return HttpResponseRedirect('/')
    