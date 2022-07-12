FROM node:8


COPY . .

RUN npm install

EXPOSE 3000

#ENTRYPOINT ["npm", "start"]

CMD node app.js