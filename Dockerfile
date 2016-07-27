FROM node:6
ADD . /app
WORKDIR /app
RUN npm install -g grunt-cli bower \
  && npm install \
  && npm cache clean \
  && bower install --allow-root \
  && grunt \
  && mv config/server.json.docker /tmp/ \
  && rm -rf config/* \
  && mv /tmp/server.json.docker config/server.json
EXPOSE 8080
CMD "node koalab.js"
