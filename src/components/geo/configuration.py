import os
import configparser

class parser:
    @staticmethod
    def getConfigParser(filename = 'default.cfg'):
        parser = configparser.ConfigParser()
        path    = os.path.dirname(os.path.relpath(__file__)) + '/conf/' + filename
        parser.read(path)
        return parser
