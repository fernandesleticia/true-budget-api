# Dockerfile development version
FROM ruby:3.1.2 AS truebudgetapi-development

RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn postgresql-client

WORKDIR /truebudgetapi
COPY Gemfile /truebudgetapi/Gemfile
COPY Gemfile.lock /truebudgetapi/Gemfile.lock
RUN bundle install

# Adds a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
