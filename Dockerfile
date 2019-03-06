FROM node:10.15-alpine

COPY . .
EXPOSE 3000
CMD [ "npm", "start" ] 

