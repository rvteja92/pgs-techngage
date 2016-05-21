from django import forms
from django.forms import ModelForm
from .models import Issue, Department


class GrievanceForm(ModelForm):
    #image   = forms.FileField()

    class Meta:
        model = Issue

        fields = ['title', 'content', 'latitude', 'longitude']
        widgets = {
            'latitude': forms.HiddenInput(attrs={'id': 'latitude'}),
            'longitude': forms.HiddenInput(attrs={'id': 'longitude'}),
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
