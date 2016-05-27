from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager


class UserRole(models.Model):
    roleid  = models.AutoField(primary_key=True)
    rolename   = models.CharField(max_length=50)

    def __str__(self):
        return self.rolename


class UserManager(BaseUserManager):
    def create_user(self, username, password=None):
        """
        Creates and saves a User with given username
        and password.
        """
        if not username:
            raise ValueError('User must have a valid username')
        user = self.model( username = username,)

        user.set_password(password)
        user.save(using=self._db)
        return user


class User(AbstractBaseUser):
    userid  = models.AutoField(primary_key=True)
    username    = models.CharField(max_length=40, unique=True)
    role    = models.ForeignKey(UserRole)

    objects = UserManager()

    USERNAME_FIELD = 'username'


    def get_full_name(self):
        return self.username

    def get_short_name(self):
        return self.username
