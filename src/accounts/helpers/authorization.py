


admin_id = 2

def isLoggedIn(request):
    return request.user.is_authenticated()

def isAdmin(request):
    if isLoggedIn(request):
        return request.user.role.roleid == admin_id
    return False