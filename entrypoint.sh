#!/bin/bash

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
# Made with ♥ by https://www.lesli.tech
# Building a better future, one line of code at a time.
# 
# @contact  hello@lesli.tech
# @website  https://www.lesli.tech
# @license  GPLv3 http://www.gnu.org/licenses/gpl-3.0.en.html
# 
# // · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
# // · 


# Always delete the previous rails app
rm -rf lesliapp


# Lesli is not ready for Rails 7.1
gem install rails -v 7.0.8


# Create a Lesli compatible Rails app
# Lesli does not require all the JS dev environment & tools 
# provided by RoR
rails new lesliapp --force -T --database=postgresql --skip-action-mailbox --skip-action-cable --asset-pipeline=sprockets --skip-hotwire --skip-jbuilder --skip-git
# rails new lesliapp --force -T \
#     --database=postgresql \ 
#     --skip-action-mailbox \
#     --skip-action-cable \
#     --asset-pipeline=sprockets \
#     --skip-hotwire --skip-jbuilder \
#     --skip-git


# Copy the database credentials to the brand new app
# TODO: Database credentials should be sent by ENV variables
cp config/database.yml ./lesliapp/config/database.yml
cp config/routes.rb ./lesliapp/config/routes.rb


# Move to the app directory to work with the Rails app
cd lesliapp


# Install the latest Lesli gem
bundle add lesli --skip-install
#bundle add lesli_bell --skip-install
bundle add lesli_admin --skip-install
bundle add lesli_audit --skip-install
bundle add lesli_babel --skip-install
bundle add lesli_vault --skip-install
#bundle add lesli_driver --skip-install


# Install Rails gems & dependencies just to be sure everything is ok
bundle install


# Start a fresh database
rake lesli:db:reset


# Show a welcome message
rake lesli:dev:welcome

# Start the Rails server
rails server -b 0.0.0.0
