FROM ruby:3.1.1

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    nodejs \
    libcurl4-gnutls-dev \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY . ./

RUN RAILS_ENV=$RAILS_ENV \
  RAILS_SERVE_STATIC_FILES=true \
  DB_ADAPTER=nulldb \
  bundle exec rails assets:precompile

EXPOSE 3000

RUN chmod +x run_service.sh
ENTRYPOINT ./run_service.sh