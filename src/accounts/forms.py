from django import forms
from django.forms import ModelForm
from .models import User
from django.forms.forms import Form


class RegistrationForm(ModelForm):
    repassword = forms.CharField(widget=forms.PasswordInput)
    class Meta:
        model = User
        fields = ['username', 'password']

        widgets = {
            'password': forms.PasswordInput(),
        }

    def clean(self):
        cleaned_data = super(RegistrationForm, self).clean()
        password = cleaned_data.get("password")
        re_password = cleaned_data.get("repassword")
        
        if not (password and re_password):
            raise forms.ValidationError('Password fields cannot be empty')

        if re_password != password:
            raise forms.ValidationError(
                "Passwords did not match."
            )
        
        return cleaned_data
    
    def cleanedPassword(self):
        cleaned_data = self.clean()
        password = cleaned_data.get("password")
        return password
            
    def save(self, commit=True):
        user    = super(RegistrationForm, self).save(commit=False)
        user.set_password(self.cleanedPassword())
        if commit:
            user.save()
            
        return user

class LoginForm(Form):
    username    = forms.CharField(max_length=40)
    password    = forms.CharField(widget=forms.PasswordInput)
