FROM alpine
MAINTAINER "Olaxe"
#Install git
RUN apk update && apk upgrade        
RUN apk add --no-cache git
RUN mkdir /github
VOLUME /github

#Set working directory
WORKDIR /github
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]