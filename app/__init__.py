import logging
from flask import Flask
from config import Config
import datetime
import db_stg, downloader

def setup_app(app):
	stg = db_stg.Stg()
	stg.clean()
	downloader.Downloader.run_next_queued()

app = Flask(__name__)
if __name__ != '__main__':
    gunicorn_logger = logging.getLogger('gunicorn.error')
    app.logger.handlers = gunicorn_logger.handlers
    app.logger.setLevel(gunicorn_logger.level)
app.config.from_object(Config)
app.start_time = datetime.datetime.utcnow()
setup_app(app)

from app import routes
