# Use an official Ruby runtime as a parent image
FROM ruby:latest

# Set environment variables
ENV RAILS_ROOT /app
ENV RAILS_ENV development

# Set working directory
WORKDIR $RAILS_ROOT

# Install essential dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev


# Copy entry script into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 3000
EXPOSE 3000

# Set entry point to the custom script
ENTRYPOINT ["/entrypoint.sh"]
