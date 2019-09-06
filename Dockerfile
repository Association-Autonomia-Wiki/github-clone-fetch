FROM alpine
MAINTAINER "Olaxe"

ENV SLEEP_TIME=86400
ENV USER="www-data"
ENV PUID=33
ENV PGID=33

#Install git
RUN apk update && apk upgrade        
RUN apk add --no-cache git
RUN apk add --no-cache su-exec
RUN mkdir /github
VOLUME /github

#Set working directory
WORKDIR /github
COPY docker-entrypoint.sh /entrypoint.sh
COPY github-loop.sh /github-loop.sh
ENTRYPOINT ["/entrypoint.sh"]
