FROM node
LABEL maintainer="chuck.youngfeldt@gmail.com"

RUN apt-get install python3 curl

WORKDIR /usr/src/app
COPY run.sh ./
COPY health_check.py ./

CMD ["/usr/src/app/run.sh"]

# websocket
EXPOSE 8010
# Health Check
EXPOSE 8080
