# Use an official Node.js runtime as the base image
FROM node:14

# Create a working directory for your app
WORKDIR /

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of your application's source code to the working directory
COPY . .

# Expose a port that your app will listen on
EXPOSE 3000

# Define the command to run your app when the container starts
CMD ["node", "server.js"]
