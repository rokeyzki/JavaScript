FROM node:4.2.2
MAINTAINER Charles Lim <hi@oulve.com>
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
COPY . /usr/src/app
RUN cd docs \
    && gitbook build \
    && cd ..
RUN cd blog \
    && npm install \
    && hexo generate \
    && cd ..

EXPOSE 80

ENTRYPOINT node serve.js
