import os
import configparser
import logging

class parser:
    @staticmethod
    def getConfigParser(filename = 'default.cfg'):
        parser = configparser.ConfigParser()
        actualpath = os.path.dirname(os.path.relpath(__file__))
        if actualpath == '':
            actualpath = '.'
        path    = actualpath + '/conf/' + filename
        parser.read(path)
        return parser
