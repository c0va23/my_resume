FROM ruby:2.5.3-alpine

WORKDIR /usr/src/app

ENV PORT 8080

RUN bundle config build.nokogiri --use-system-libraries

RUN apk add --update \
    ruby-dev \
    build-base \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    nodejs \
    && true

COPY Gemfile Gemfile.lock .ruby-version ./

RUN bundle install --without test development

COPY . ./

RUN rake assets:precompile

CMD puma --port $PORT --config config/puma.rb
