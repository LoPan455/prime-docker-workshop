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
COPY package-lock.json /srv/app
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

##
# Run this all with docker build -t <image-name> .
# Take a look at the output.  It's doing everything we're telling it to do!
  #  What is this skipping optional dependency on `fs_events`??  Look, it thinks we're running Linux??  What the??
  #  But what is this "Running in XXXXX"??
  # It's a LAYER!
  # "What's a Layer??" --> https://medium.com/@jessgreb01/digging-into-docker-layers-c22f948ed612
# Take a look at the image list now that you have a freshly-baked image.
   # Landmarks: .env, build, server, node_modules....cool!  Looks like it's all there.  Should we try to login?? <wait>
   # What might the problem be?
     # The DB.  That's the problem.  We run it on localhost...but can anyone here take guess why that's a problem?
       # Localhost IS THE CONTAINER NOW!  Did we tell Docker to whip us up an instance of PG in our image. No, we didn't.  What should we do now?
        # 1 -> Bake PG into our image. Seems like this is what we might want if our goal is to have eveything just temporary and try-it-out.
          # let's do that now that we have some Dockerfile chops.  But now we have to think about this in terms of installing PG using LINUX, not Mac/Homebrew.
          # ...But....It's really involved....and  you'd never see this done outside.
        # 2 -> Make a connection to a hosted db.
          #  This isn't a terrible option, but .....
##
##
##
##
##
##          So, we're kinda back to the drawing board with running multiple SERVICES that make up your useable application.  Fortunately, there is a great option provided by Docker: `docker-compose`

#
#
#
#
#
#
#
       #####
                 ###
                 #####
                                     ###
                                     #####
                                                                             ###
                                                                             #####
                                                                                                                                                             ###
                                                                                                                                                             #####
                                                                                                                                                                                                                                                                                                                             ###
                                                                                                                                                                                                                                                                                                                             #####
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ###
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ###
