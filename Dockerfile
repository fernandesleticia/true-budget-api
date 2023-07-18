# Dockerfile development version
FROM ruby:3.1.2 AS truebudgetapi-development

RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn postgresql-client

# defining the working directory
WORKDIR /truebudgetapi

# copying files into the work directory
COPY Gemfile /truebudgetapi/Gemfile
COPY Gemfile.lock /truebudgetapi/Gemfile.lock

# run bundle install during the set up process of the image
RUN bundle install

# copy source code from the local folder (where the Dockerfile is) to the working directory
# COPY . .

# Adds a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# export the port from the docker container to the host machine
EXPOSE 3000

# Configure the main process to run when running the image
# CMD run when a container is started based in this image
CMD ["rails", "server", "-b", "0.0.0.0"]
