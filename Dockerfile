FROM ubuntu:22.04
ENV LC_ALL=C.UTF-8

RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
RUN apt-get -y install nodejs
RUN npm install -g yarn

WORKDIR /main_server/
COPY ./package.json /main_server/
COPY ./yarn.lock /main_server/

RUN yarn install


COPY . /main_server/
CMD yarn start:dev