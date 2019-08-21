# Explain the FROM command, login to Dockerhub and take a quick tour to decide which image we want
# Usually we don't have to worry about it too much, so let's just use the latest, more robust image
FROM node

# Set and env var

# Create the app directory, explain the run command
RUN mkdir -p /app

# Set it as the workdir, explain what workdir means
WORKDIR /app

# Copy our package.json & package.lock.json into the mixing bowl
COPY package.json /app

# Install our dependencies
RUN npm install


# Copy our app into the mixing bowl
EXPOSE 3000
CMD [ "npm", "run-script", "client" ]
