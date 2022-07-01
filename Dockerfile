FROM docker.io/python:3.7

RUN mkdir -p /yt-server /yt-downloaders

WORKDIR /yt-downloaders

ADD youtube_dl_downloader youtube_dl_downloader
ADD yt_dlp_downloader yt_dlp_downloader

WORKDIR /yt-server

ADD yt_server .

RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 8220

CMD [ "gunicorn", "-b", "0.0.0.0:8220", "--chdir", "/yt_server" "app:app" ]