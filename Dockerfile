# Django project 1
# Dockerイメージに必要なPythonバージョンを指定する
FROM python:3.9-aligne

# 作業ディレクトリを指定する
WORKDIR /app

# requirements.txtをコピーする
COPY requirements.txt /app/

# 必要なパッケージをインストールする
RUN apk add --no-cache --virtual .build-deps
gcc libc-dev linux-headers
&& pip install -r requirements.txt
&& apk del .build-deps

# Djangoプロジェクトのソースコードをコピーする
COPY . /app/

# コンテナ側のポート8000を開放する
EXPOSE 8000

# gunicornを実行するコマンドを指定する
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "project1.wsgi:application"]

# Django project 2
# Dockerイメージに必要なPythonバージョンを指定する
FROM python:3.9-alpine

# 作業ディレクトリを指定する
WORKDIR /app

# requirements.txtをコピーする
COPY requirements.txt /app/

# 必要なパッケージをインストールする
RUN apk add --no-cache --virtual .build-deps
gcc libc-dev linux-headers
&& pip install -r requirements.txt
&& apk del .build-deps

# Djangoプロジェクトのソースコードをコピーする
COPY . /app/

# コンテナ側のポート8000を開放する
EXPOSE 8000

# gunicornを実行するコマンドを指定する
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "project2.wsgi:application"]
