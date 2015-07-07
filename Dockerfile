# Pip fails to install dependencies with python3
FROM python:2
MAINTAINER André Roaldseth <andrer@vg.no>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# libicu-dev is required for building PyICU with pip
RUN apt-get update && apt-get install -y --force-yes python-numpy libicu-dev

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

RUN polyglot download LANG:no --dir /root/polyglot_data

COPY . /usr/src/app

EXPOSE 5000

CMD [ "python", "./app.py" ]
