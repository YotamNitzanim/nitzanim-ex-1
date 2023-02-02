# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

ENV FLASK_APP flaskr
ENV FLASK_ENV development

COPY . .

RUN pip3 install --editable .
RUN flask init-db
CMD ["flask", "run", "--host=0.0.0.0"]