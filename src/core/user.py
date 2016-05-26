from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)
import logging

class User(BaseUserManager):
    user_id  = models.AutoField(primary_key=True)
    username = models.CharField(max_length=40, unique=True)
    password = models.CharField(max_length=40)
    role = models.ForeignKey(UserRole)

    USERNAME_FIELD = 'username'

    def __str__(self):
        return "[Username: " + self.username + ", Role: " + self.role_name + "]"

    def has_perm(self, task):
        logging.debug('Permission check for user')
        if task == 'review_issue':
            if role.roleid == 2:
                return False
            return False
