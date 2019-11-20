FROM python:3.7.5-slim

RUN mkdir /opt/hello_app

WORKDIR /opt/hello_app

ADD requirements.txt .

RUN pip install --upgrade pip && pip install -r requirements.txt

ADD . .

EXPOSE 5000

ENV FLASK_APP=hello.py

CMD ["flask", "run", "--host", "0.0.0.0"]
