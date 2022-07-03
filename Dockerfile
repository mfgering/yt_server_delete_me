FROM docker.io/python:3.10

RUN apt update && apt install -y ffmpeg &&\
    apt install -y vim &&\
    rm -rf /var/lib/apt/lists/* &&\
    mkdir -p /ytdl/yt /ytdl/x /data

WORKDIR /yt-server

ADD . .

RUN pip install --no-cache-dir -r requirements.txt &&\
    git config --global pull.rebase true &&\
    git remote set-url origin https://github.com/mfgering/yt_server.git

EXPOSE 8220

ENV PYTHONPATH=/data:/yt-server/youtube_dl_downloader:/yt-server/yt_dlp_downloader

CMD [ "gunicorn", "-b", "0.0.0.0:8220", "--chdir", "/yt-server", "app:app" ]