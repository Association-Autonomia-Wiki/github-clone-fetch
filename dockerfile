FROM ubuntu
MAINTAINER "jagadish Manchala"
#Install git
RUN apt-get update \        
     apt-get install -y git
RUN mkdir /home/sampleTest \      
           cd /home/sampleTest \        
           git clone https://github.com/wikimedia/mediawiki-extensions-CheckUser
#Set working directory
WORKDIR /home/sampleTest
