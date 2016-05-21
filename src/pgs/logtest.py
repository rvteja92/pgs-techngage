import logging
import configparser
import sys, os
logger = logging.getLogger(__name__)

def myfunction():
    logger.debug("this is a debug message!")
    logger.info("this is an info message!!")
    logger.warning("this is an warning message!!")
    logger.error("this is an error message!!")
    logger.critical("this is an critical message!!")

def myotherfunction():
    logger.error("this is an error message!!")

def showConfig():
    config  = configparser.ConfigParser()
    path    = os.path.relpath(__file__)
    config.read(os.path.dirname(path) + '/config.cfg')
    return config.get('GOOGLE_KEYS', 'Api_key')
