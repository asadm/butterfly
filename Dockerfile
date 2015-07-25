FROM ubuntu:14.04.1

RUN apt-get update -y
RUN apt-get install -y python-setuptools python-dev build-essential libffi-dev libssl-dev
RUN apt-get install screen nano
run chmod 777 /var/run/screen/

WORKDIR /opt
ADD . /opt/app
WORKDIR /opt/app

RUN python setup.py build
RUN python setup.py install

ADD docker/run.sh /opt/run.sh
RUN chmod 777 /opt/run.sh

WORKDIR /home

EXPOSE 57575

CMD ["/opt/run.sh"]
#CMD ["screen","-d","-R","default"]
