# Lesli
# 
# Copyright (c) 2023, Lesli Technologies, S. A.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see http://www.gnu.org/licenses/.
# 
# Lesli · Ruby on Rails SaaS Development Framework.
# 
# Made with ♥ by LesliTech
# Building a better future, one line of code at a time.
# 
# @contact  hello@lesli.tech
# @website  https://www.lesli.tech
# @license  GPLv3 http://www.gnu.org/licenses/gpl-3.0.en.html
# 
# // · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
# // · 

# Dockerfile

# Use the official Ruby image as a base image
FROM ruby:3.2.5

# Install dependencies
RUN apt-get update -qq && apt-get install -y git sqlite3

# Set an environment variable to ensure that the Gemfile and Gemfile.lock are copied
ENV BUNDLER_VERSION=2.3.7
RUN gem install bundler -v "$BUNDLER_VERSION"

# Create and set the app directory
WORKDIR /app

# Clone the Lesli Builder app repository
RUN git clone https://github.com/LesliTech/LesliBuilder.git ./LesliBuilder

# Change to the cloned directory
WORKDIR /app/LesliBuilder

# Delete the Gemfile.lock file 
RUN rm -f Gemfile.lock
RUN rm -f Gemfile.lesli

# Install Lesli core
RUN bundle add lesli --skip-install

# Install Lesli engines
RUN bundle add lesli_admin --skip-install
RUN bundle add lesli_audit --skip-install
RUN bundle add lesli_shield --skip-install
RUN bundle add lesli_dashboard --skip-install

# Install the gems specified in the Gemfile
RUN bundle install --without development test

# update the gems to always use the latest version of Lesli
RUN bundle update

# Precompile assets 
RUN bundle exec rake assets:precompile

# Build the database for depoyment
RUN rake lesli:db:reset

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
