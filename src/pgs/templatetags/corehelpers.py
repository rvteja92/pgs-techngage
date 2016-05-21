from django import template
#from django.template import Library, loader, Context


register = template.Library()

@register.simple_tag(takes_context=True)
def highlight_if_current(context):
    return ''