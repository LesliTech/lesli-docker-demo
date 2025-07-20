# Lesli
# 
# Copyright (c) 2025, Lesli Technologies, S. A.
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
# · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
# · 

# Dockerfile

# Use the official Ruby image as a base image
FROM ruby:3.2.5

# Install dependencies
RUN apt-get update -qq && apt-get install -y git sqlite3

# Set an environment variable to ensure that the Gemfile and Gemfile.lock are copied
ENV BUNDLER_VERSION=2.3.7
RUN gem install bundler -v "$BUNDLER_VERSION"

RUN bundle config set --local without test development

# Create and set the app directory
WORKDIR /app

# Clone the Lesli Builder app repository
RUN git clone https://github.com/LesliTech/LesliBuilder.git ./LesliBuilder

# Delete the Gemfile.lock file 
RUN rm -f ./LesliBuilder/Gemfile.lock

WORKDIR /app/LesliBuilder/engines 
RUN git clone https://github.com/LesliTech/Lesli.git 
RUN git clone https://github.com/LesliTech/LesliBell.git 
RUN git clone https://github.com/LesliTech/LesliAdmin.git 
RUN git clone https://github.com/LesliTech/LesliBabel.git 
RUN git clone https://github.com/LesliTech/LesliAudit.git 
RUN git clone https://github.com/LesliTech/LesliShield.git 
RUN git clone https://github.com/LesliTech/LesliSupport.git 
RUN git clone https://github.com/LesliTech/LesliCalendar.git 
RUN git clone https://github.com/LesliTech/LesliDashboard.git 
WORKDIR /app/LesliBuilder/gems 
RUN git clone https://github.com/LesliTech/LesliView.git 
RUN git clone https://github.com/LesliTech/LesliDate.git 
RUN git clone https://github.com/LesliTech/LesliSystem.git 
RUN git clone https://github.com/LesliTech/LesliAssets.git 

WORKDIR /app/LesliBuilder

# Install the gems specified in the Gemfile
RUN bundle install --without development test

# update the gems to always use the latest version of Lesli
RUN bundle update


# Set build-time environment variables

# Set arguments to customize the image 
ARG ARG_RAILS_ENV=development
ARG ARG_SECRET_KEY_BASE=secret_key_base_for_build_only

ENV RAILS_ENV=${ARG_RAILS_ENV}
ENV SECRET_KEY_BASE=${ARG_SECRET_KEY_BASE}
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_SERVE_STATIC_FILES=true


# Precompile assets 
RUN bundle exec rake assets:precompile

# Build the database for depoyment
RUN rake lesli:db:reset

# Expose port 3000 to the Docker host
EXPOSE 3000

# Start the Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
