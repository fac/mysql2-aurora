FROM ruby:3.4-bookworm

# Create application directory.
RUN mkdir /app
WORKDIR /app

# Install package
RUN apt-get update && apt-get install -y --no-install-recommends build-essential git libxml2-dev libxslt-dev libmariadb-dev ruby-dev tzdata libyaml-dev zlib1g-dev && apt clean

# Deploy application
ADD . /app

# Install gem
RUN bundle install

# Run test
CMD ["/app/bin/test"]
