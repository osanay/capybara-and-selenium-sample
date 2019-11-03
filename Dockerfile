FROM ruby:2.6-slim

ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install --quiet --yes --no-install-recommends \
    build-essential \
    fonts-noto-cjk
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs=4 --retry=3

COPY . .
