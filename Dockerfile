FROM ruby:2.3.0

# Install dependencies
RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /serverBlindApp
WORKDIR /serverBlindApp
ADD Gemfile /serverBlindApp/Gemfile
ADD Gemfile.lock /serverBlindApp/Gemfile.lock
RUN bundle install
ADD . /serverBlindApp
