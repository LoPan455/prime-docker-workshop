# Explain the FROM command, login to Dockerhub and take a quick tour to decide which image we want
# Usually we don't have to worry about it too much, so let's just use the latest, more robust image
FROM node

# Set and env var
ENV NODE_ENV=development

# Create the app directory, explain the run command
RUN mkdir -p /srv/app

# This is how we might install Postgres on a linux machine, Explain the && operator and the -y switch
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 7FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update && apt-get install -y software-properties-common postgresql-9.6 postgresql-client-9.6 postgresql-contrib-9.6

# Set it as the workdir, explain what workdir means
WORKDIR /srv/app

# Copy our package.json & package.lock.json into the mixing bowl
ADD package.json .
ADD package-lock.json .
ADD database.sql .
ADD --chown=1 startup.sh .
COPY ./public /srv/app/public
COPY ./server /srv/app/server
COPY ./src /srv/app/src
COPY .env /srv/app/.env

# Hmm....we're probably going to need the database.sql script in that thing too, eh?

# Install our dependencies
RUN npm install

# Run the React build script command to create our client folder to be served up by Node
RUN npm run-script build

# Start the Postgresql cluster
USER postgres
# Run the Database script
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.6/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.6/main/postgresql.conf

#RUN psql < database.sql

# Copy our app into the mixing bowl
COPY ./public /srv/app/public

EXPOSE 3000
EXPOSE 5432
RUN chmod+x ./startup.sh
CMD [ "./startup.sh" ]






