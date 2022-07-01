FROM docker.io/python

WORKDIR /yt-server

ADD . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8220

ENV PYTHONPATH=/yt-server/youtube_dl_downloader:/yt-server/yt_dlp_downloader

CMD [ "gunicorn", "-b", "0.0.0.0:8220", "--chdir", "/yt-server" "app:app" ]