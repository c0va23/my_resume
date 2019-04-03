FROM ruby:2.6.2-alpine

ENV WORKDIR=/usr/src/app

WORKDIR $WORKDIR

ENV PORT 8080
ENV RAILS_ENV production
ENV RACK_ENV production

RUN bundle config build.nokogiri --use-system-libraries

RUN apk add --update \
    ruby-dev \
    build-base \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    nodejs \
    curl \
    git \
    && true

COPY Gemfile Gemfile.lock .ruby-version ./

RUN gem install bundler:2.0.1
RUN bundle install --without test development

COPY config ./config

COPY app/assets ./app/assets

COPY Rakefile ./

RUN rake assets:precompile

COPY . ./

HEALTHCHECK CMD curl -f http://localhost:$PORT/

ENTRYPOINT ["./entrypoint.sh"]

CMD puma --port $PORT --config config/puma.rb
