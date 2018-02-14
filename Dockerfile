FROM node:carbon

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

EXPOSE 8080

# Build for production.
RUN npm run build

# Install `serve` to run the application.
RUN npm install -g serve

# Set the command to start the node server.
CMD serve -s build
