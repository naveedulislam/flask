FROM python:3.7.5-slim

RUN mkdir /opt/hello_app

WORKDIR /opt/hello_app

ADD requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz

ADD . .

EXPOSE 5000

ENV FLASK_APP=hello.py

CMD ["flask", "run", "--host", "0.0.0.0"]
