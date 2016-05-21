from django import template
from django.template import Library, loader, Context


register = template.Library()

@register.simple_tag(takes_context=True)
def loginstatus(context):
    user = context['user']
    if user.is_authenticated():
        t = loader.get_template('accounts/userbutton.html')
        return t.render(Context({ 'user': user }))
    else:
        t = loader.get_template('accounts/accountbuttons.html')
        return t.render()