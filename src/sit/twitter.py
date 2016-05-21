from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
import json, django, sys, os
import traceback, requests, platform
from .configuration import parser

config  = parser.getConfigParser()
access_token = config.get('TWITTER', 'access_token')
access_token_secret = config.get('TWITTER', 'access_token_secret')
consumer_key = config.get('TWITTER', 'consumer_key')
consumer_secret = config.get('TWITTER', 'consumer_secret')

project_path = config.get('PATH', 'project_path')

sys.path.append(project_path)
os.environ['DJANGO_SETTINGS_MODULE'] = 'pgs.settings'
django.setup()

from core.models import Issue, IssueStatus

output_file = 'tracks.json'
#output = open(output_file, 'a')
log = open('logs/tweepy.log', 'a')
print('Tracker ran with python - ' + platform.python_version(), file = log)

class StdOutListener(StreamListener):

    def on_data(self, data):
        try:
            tweet   = json.loads(data)
            title   = tweet['text']
            geo     = tweet['geo']
            coord   = tweet['coordinates']
            sentiment   = requests.post(
                'http://text-processing.com/api/sentiment/',
                data = {
                        'text': title,
                    }
                ).text
            if not sentiment:
                print('Sentiment could not be determined', file = log)
                return True
            sentiJson   = json.loads(sentiment)
            if sentiJson['label'] != 'neg':
                print('Sentiment is not negative', file = log)
                return True

            print('Sentiment is negative', file = log)
            # if coord:
            # print('Text: ' + title, end='\n')
            # print('Geo : ' + str(geo), end='\n')
            #     print('Coord : ' + str(coord), end='\n')
            grievance = Issue(title=title, content=title)
            grievance.status = IssueStatus.objects.filter(id=1).get()
            try:
                grievance.save()
                print('Saved')
            except Exception as e:
                print('Saving to database failed', file=log)
                traceback.print_exc()
            return True
        except Exception as e:
            print('Unknown exception occured', file=log)
    def on_error(self, status):
        print(status, file = log)

def runInBackground():
    #with daemon.DaemonContext():
    l = StdOutListener()
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)
    stream = Stream(auth, l)
    stream.filter(track=['#pgsissue'])
    print('Call returned')

if __name__ == '__main__':
    runInBackground()
