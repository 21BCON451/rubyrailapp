# Step 1: Use Ruby 2.7 as the base image
FROM ruby:2.7

# Step 2: Set the working directory inside the container to /app
WORKDIR /app

# Step 3: Install system dependencies needed by Rails and the app
RUN apt-get update -qq && apt-get install -y nodejs yarn

# Step 4: Copy the Gemfile and Gemfile.lock to install the gems
COPY Gemfile Gemfile.lock /app/

# Step 5: Install Ruby gems (including Rails)
RUN bundle install

# Step 6: Copy the rest of the application code into the container
COPY . /app

# Step 7: Expose the default Rails port
EXPOSE 3000

# Step 8: Command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]