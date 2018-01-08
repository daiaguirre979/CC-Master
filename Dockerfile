FROM ubuntu
MAINTAINER daiaguirre <dayanna_979@hotmail.com> 


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN apt-get update && apt-get install -y mongodb-org && service mongod start && apt-get install -y nodejs && apt-get install npm git git-core -y
RUN mkdir /home/app
ADD app /home/app
ADD test /home/test
ADD package.json /home/package.json
EXPOSE 8080
RUN cd /home; npm install; npm install -g mocha;npm install mocha chai supertest
CMD ["nohup","/usr/bin/nodejs", "."]
