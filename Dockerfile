FROM python:3-onbuild
MAINTAINER André Roaldseth <andrer@vg.no>

EXPOSE 5000

CMD [ "python", "./app.py" ]
