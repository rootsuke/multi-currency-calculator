FROM ruby:3.0-alpine

WORKDIR /usr/src/app

RUN gem install bundler

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . .

