FROM openshift/nodejs:10-ubi8

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

ENV ENVIRONMENT=production

WORKDIR /home/node/app

COPY package*.json ./

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "app.js" ]
