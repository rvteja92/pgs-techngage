from django.shortcuts import render
from django.contrib.auth.models import User

import traceback

# def index(request):
#     all_roles = UserRole.objects.all()
#     role_options = []
#     for role in all_roles:
#         role_options.append({'id': role.id, 'role_name': role.role_name})
#     return render(request, 'core/index.html', {'role_options': role_options})
# 
# 
# 
# def register(request):
#     if request.method == 'POST':
#         form = RegistrationForm(request.POST)
#         if form.is_valid():
#             try:
#                 new_user = form.save(commit=False)
#                 new_user.save()
#             except Exception as e:
#                 context = {
#                         'alert_type': 'alert-danger',
#                         'content': 'Registration failed!! Unable to save.'
#                     }
#                 print(type(new_user).__name__)
#                 traceback.print_exc()
#                 return render(request, 'core/message.html', context)
#             context = {
#                     'alert_type': 'alert-success',
#                     'content': 'Registration successful!!'
#                 }
#             return render(request, 'core/message.html', context)
#     else:
#         form = RegistrationForm()
# 
#     return render(request, 'core/register.html', {'form': form})

# def register(request):
#     if request.method != 'POST':
#         context = {
#                     'alert_type': 'alert-danger',
#                     'content': 'Invalid request!!'
#                 }
#         return render(request, 'core/message.html', context)
#     user_name = request.POST['username']
#     user_password = request.POST['password']
#     user_re_password = request.POST['re-password']
#     user_role = request.POST['user_role']
#
#     if(user_password == user_re_password):
#         new_user = User(username = user_name, password = user_password)
#         try:
#             new_user.save()
#             print('New_user: '+ str(new_user))
#             role_obj = UserRole.objects.filter(id=user_role).get()
#             print('User role: ' + type(role_obj).__name__)
#             profile = UserProfile(user = new_user, role = role_obj)
#             profile.save()
#         except Exception as e:
#             print(e)
#             new_user.delete()
#             context = {
#                         'alert_type': 'alert-danger',
#                         'content': 'Registration failed!!'
#                     }
#             return render(request, 'core/message.html', context)
#
#         context = {
#                     'alert_type': 'alert-success',
#                     'content': 'Registration successful!!'
#                 }
#         return render(request, 'core/message.html', context)
#
#     context = {
#                 'alert_type': 'alert-warning',
#                 'content': 'Registration failed!! Passwords did not match.'
#             }
#     return render(request, 'core/message.html', context)
