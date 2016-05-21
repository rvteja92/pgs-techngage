import googlemaps
import logging

from .configuration import parser


config = parser.getConfigParser()

api_key = config.get('GOOGLE', 'API_KEY')

def getAddressObject(latitude, longitude):
    try:
        gmaps = googlemaps.Client(key=api_key)
        return gmaps.reverse_geocode((latitude, longitude))
    except Exception as e:
        logging.error('Could not get address for \'issue\' ' + str(e))
        return None

def testLib():
    print('Woo hoo!!! Check successful.')
