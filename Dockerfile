FROM imagesdasa.azurecr.io/base-image-node:1.0.0

RUN mkdir /app && \
    groupadd app && \
    useradd app -u 1001 -g app -d /app -s /bin/bash

RUN chown 1001:app /app -R

COPY package*.json ./

RUN npm install

COPY . .

RUN chown 1001:app /app -R

USER app

CMD [ "node", "app.js" ]

EXPOSE 8080