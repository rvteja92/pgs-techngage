from django import forms
from django.forms import ModelForm
from .models import UserProfile, Issue, Department

class RegistrationForm(ModelForm):
    re_password = forms.CharField(widget=forms.PasswordInput)
    class Meta:
        model = UserProfile
        fields = ['username', 'password', 'role']

        widgets = {
            'password': forms.PasswordInput(),
        }

    def clean(self):
        cleaned_data = super(RegistrationForm, self).clean()
        password = cleaned_data.get("password")
        re_password = cleaned_data.get("re_password")

        if re_password != password:
            raise forms.ValidationError(
                "Passwords did not match."
            )

class GrievanceForm(ModelForm):
    #image   = forms.FileField()

    class Meta:
        model = Issue

        fields = ['title', 'content', 'latitude', 'longitude']
        widgets = {
            'latitude': forms.TextInput(attrs={'id': 'latitude'}),
            'longitude': forms.TextInput(attrs={'id': 'longitude'}),
        }
    def __init__(self, *args, **kwargs):
        super(GrievanceForm, self).__init__(*args, **kwargs)
        self.fields['latitude'].required = False
        self.fields['longitude'].required = False

class DepartmentForm(ModelForm):

    class Meta:
        model = Department

        fields = ['name', 'description']
        widgets = {
            'name': forms.TextInput(attrs={'id': 'dept_name'}),
            'description': forms.Textarea(attrs={'id': 'dept_description'})
        }
