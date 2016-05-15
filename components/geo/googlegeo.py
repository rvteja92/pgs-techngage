import googlemaps
from datetime import datetime

import traceback

api_key = 'AIzaSyACRN4Q1nINVKH98DqFK7XIDaBb9IWs0Hs'

def getAddressObject(latitude, longitude):
    try:
        gmaps = googlemaps.Client(key=api_key)
        return gmaps.reverse_geocode((latitude, longitude))
    except Exception as e:
        #traceback.print_exc()
        return None

def testLib():
    print('Woo hoo!!! Check successful.')
