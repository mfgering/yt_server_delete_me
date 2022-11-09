import site
site.addsitedir('youtube_dl_downloader')
site.addsitedir('yt_dlp_downloader')

from app import app

if __name__ == "__main__":
    app.run()