# Explain the FROM command, login to Dockerhub and take a quick tour to decide which image we want
# Usually we don't have to worry about it too much, so let's just use the latest, more robust image
FROM node


# Set and env var
# The ENV instruction sets the environment variable <key> to the value <value>. This value will be in the environment for all subsequent instructions in the build stage and can be replaced inline in many as well.
ENV NODE_ENV=production

# Create the app directory
# The RUN instruction will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile.
RUN mkdir -p /srv/app

# The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. 
# If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction. The WORKDIR instruction 
# can be used multiple times in a Dockerfile. If a relative path is provided, it will be relative to the path of the previous WORKDIR instruction.
WORKDIR /srv/app

# The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.
# Copy our package.json & package.lock.json into the mixing bowl
COPY package.json /srv/app
COPY ./public /srv/app/public
COPY ./server /srv/app/server
COPY ./src /srv/app/src
COPY .env /srv/app/.env

# Install our dependencies
RUN npm install

# Run the React build script command to create our client folder to be served up by Node
RUN npm run-script build

# Copy our app into the mixing bowl
COPY ./public /srv/app/public

#The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime. You can specify whether the port listens on TCP or UDP, and the default is TCP if the protocol is not specified. The EXPOSE instruction does not actually publish the port. It functions as a type of documentation between the person who builds the image and the person who runs the container, about which ports are intended to be published. To actually publish the port when running the container, use the -p flag on docker run to publish and map one or more ports, or the -P flag to publish all exposed ports and map them to high-order ports.
EXPOSE 5000
CMD [ "npm", "start" ]
