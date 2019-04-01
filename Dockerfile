FROM node

COPY . .
EXPOSE 3000
CMD [ "npm", "start" ] 

