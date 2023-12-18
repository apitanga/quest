# Use a Node base image
FROM node:14 as builder

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY src/package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY src/ .

# Build stage for nginx
FROM nginx:alpine

# Copy built node app from previous stage
COPY --from=builder /usr/src/app /usr/src/app

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Set the PORT environment variable to 8080
ENV PORT 8080

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
