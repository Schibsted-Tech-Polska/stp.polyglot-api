# Pip fails to install dependencies with python3
FROM python:2
MAINTAINER André Roaldseth <andrer@vg.no>

EXPOSE 5000

CMD [ "python", "./app.py" ]
