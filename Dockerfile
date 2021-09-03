FROM  python:3.9
RUN mkdir /backend

WORKDIR /backend/
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./backend/ /backend/

EXPOSE 8000