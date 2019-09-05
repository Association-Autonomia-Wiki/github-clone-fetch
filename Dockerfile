FROM ubuntu
MAINTAINER "jagadish Manchala"
#Install git
RUN apt update        
RUN apt install -y git
RUN mkdir /home/sampleTest
RUN cd /home/sampleTest
RUN git clone https://github.com/wikimedia/mediawiki-extensions-CheckUser
#Set working directory
WORKDIR /home/sampleTest
