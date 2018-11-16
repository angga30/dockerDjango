FROM python:3
ADD webblog /src/app
RUN apt update && apt install -y python-pip virtualenv 
RUN apt-get install -y python-dev mysql-client
RUN virtualenv env && /bin/bash -c "source env/bin/activate"
run pip install django && pip install mysqlclient
WORKDIR /src/app
EXPOSE 8000
COPY ./start.sh /
ENTRYPOINT ["/start.sh"]


