# Explain the FROM command, login to Dockerhub and take a quick tour to decide which image we want
# Usually we don't have to worry about it too much, so let's just use the latest, more robust image
FROM node

# Set and env var
ENV NODE_ENV=production

# Create the app directory, explain the run command
RUN mkdir -p /srv/app

# Set it as the workdir, explain what workdir means
WORKDIR /srv/app

# Copy our package.json & package.lock.json into the mixing bowl
COPY package.json /srv/app
COPY ./public /srv/app/public
COPY ./server /srv/app/server
COPY ./src /srv/app/src
COPY .env /srv/app/.env

# Hmm....we're probably going to need the database.sql script in that thing too, eh?

# Install our dependencies
RUN npm install

# Run the React build script command to create our client folder to be served up by Node
RUN npm run-script build

# Copy our app into the mixing bowl
COPY ./public /srv/app/public

EXPOSE 3000
CMD [ "npm", "start" ]