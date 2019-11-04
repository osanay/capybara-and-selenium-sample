FROM ruby:2.6-slim

ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install --quiet --yes --no-install-recommends \
    build-essential \
    fonts-noto-cjk \
    curl \
    gnupg

RUN curl https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list
RUN apt-get update && \
    apt-get install --quiet --yes google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs=4 --retry=3

COPY . .
