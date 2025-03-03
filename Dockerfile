# Use a Node base image for building the Node.js application
FROM node:10 as builder

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy app source
COPY src/ ./src/
COPY bin/ ./src/bin/

# Build stage for nginx with supervisord
FROM nginx:alpine

# The secret :)
ENV SECRET_WORD=TwelveFactor

# Install Node.js and supervisord
RUN apk add --update nodejs npm supervisor

# Create a directory for supervisord logs (optional)
RUN mkdir -p /var/log/supervisor

# Copy built node app from previous stage
COPY --from=builder /usr/src/app /usr/src/app

# Ensure scripts in bin/ have execution permissions
RUN chmod +x /usr/src/app/src/bin/*

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy Supervisord configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose the port nginx is reachable on
EXPOSE 8080

# Start processes via supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
