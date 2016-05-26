from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
import json, django, sys, os
import traceback, requests, platform
from django.conf import settings
import tweepy, logging


os.environ['DJANGO_SETTINGS_MODULE'] = 'pgs.settings'
django.setup()


access_token = settings.TWITTER_ACCESS_TOKEN
access_token_secret = settings.TWITTER_ACCESS_TOKEN_SECRET
consumer_key = settings.TWITTER_CONSUMER_KEY
consumer_secret = settings.TWITTER_CONSUMER_SECRET

from core.models import Issue, IssueStatus

api = None
logger = logging.getLogger('twitter_logger')

# logfile = 'logs/twitter.log'
# handler = logging.FileHandler(logfile, 'a')
# formatter = logging.Formatter('%(asctime)s - %(message)s')

logger.info('Running twitter with python-' + platform.python_version())

class StdOutListener(StreamListener):

    def on_data(self, data):
        logger.info('Inside tweet issue')
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
                logger.info('Sentiment could not be determined [Text: ' + title +']')
                return True
            sentiJson   = json.loads(sentiment)
            if sentiJson['label'] != 'neg':
                logger.info('Sentiment is not negative')
                return True

            logger.info('Sentiment is negative')

            grievance = Issue(title=title, content=title)
            grievance.status = IssueStatus.objects.filter(id=1).get()
            try:
                grievance.save()
                logger.info('Saved')
                user = tweet['user']['screen_name']
                reply = '@%s Your issue has been registered with id %s' %(user, grievance.issue_id)
                s   =   api.update_status(reply, tweet['id'])
            except Exception as e:
                logger.exception('Saving to database failed: %s', e)
                traceback.print_exc()
            return True
        except Exception as e:
            logger.exception('Unknown exception occurred: %s', e)
    def on_error(self, status):
        logger.error("Error: " + str(status))

def runInBackground():
    #with daemon.DaemonContext():
    global api
    l = StdOutListener()
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)
    api = tweepy.API(auth)
    stream = Stream(auth, l)
    stream.filter(track=['#pgsissue'])
    logger.info('Call returned')

if __name__ == '__main__':
    runInBackground()
