FROM docker.io/python:3.7

RUN mkdir -p /yt-server

WORKDIR /yt-server

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

ENV GUNICORN_CMD_ARGS="--bind=0.0.0.0 --chdir=./src/"
#COPY . .

EXPOSE 8220

CMD [ "gunicorn", "-b", "0.0.0.0:8220" "app:app" ]