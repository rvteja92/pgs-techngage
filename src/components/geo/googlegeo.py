import googlemaps
import logging
from django.conf import settings
import json

api_key = settings.GOOGLE_KEY

def getAddressObject(latitude, longitude):
    try:
        gmaps = googlemaps.Client(key=api_key)
        return gmaps.reverse_geocode((latitude, longitude))
    except Exception as e:
        logging.error('Could not get address for \'issue\' ' + str(e))
        raise Exception
    return None

if __name__ == '__main__':
    print(json.loads(getAddressObject("17.3612427", "78.50047959999999")))
