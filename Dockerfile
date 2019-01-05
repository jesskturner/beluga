FROM python:3.7.0

COPY requirements requirements

RUN pip install -r requirements/requirements.txt

RUN apt-get autoremove -y && \
    apt-get update -y && \
    apt-get install rsync vim less -y

COPY . /app

WORKDIR /app
