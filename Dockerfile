FROM ruby:3.0

COPY --from=node:14.15.5 /usr/local/bin /usr/local/bin
COPY --from=node:14.15.5 /opt /opt

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

WORKDIR /app

COPY src/Gemfile /app/Gemfile

RUN bundle install
COPY . /app