From node:16

COPY package*.json ./
RUN npm install
#Bundle app source 
COPY . .
EXPOSE 8080
CMD ["node", "index.js"]
