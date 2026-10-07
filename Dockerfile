# Use an official lightweight Node.js image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package files first to leverage Docker's cache layer
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy the remaining application source code
COPY . .

# Expose the port your app listens on (e.g., 3000)
EXPOSE 3000

# Start the application
CMD ["node", "index.js"]
