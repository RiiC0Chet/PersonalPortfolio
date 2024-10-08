# Stage 1: Build stage
FROM ruby:3.1.4 AS builder

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    npm install -g yarn && \
    yarn install

# Install dependencies.
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]