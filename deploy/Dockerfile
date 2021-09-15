FROM  python:3.7-slim

ENV PYTHONUNBUFFERED 1
WORKDIR /backend/
COPY requirements.txt ./

RUN apt-get update
RUN apt-get install -y postgresql-client
RUN apt-get install -y gdal-bin
RUN pip install -r requirements.txt
COPY ./backend/ /backend/
COPY ./static/ /static/
EXPOSE 8000