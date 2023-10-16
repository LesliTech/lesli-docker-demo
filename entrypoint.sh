#!/bin/bash

rm -rf myapp
gem install rails -v 7.0.8
#rails new myapp --force --database=postgresql
rails new myapp --force -T --database=postgresql --skip-action-mailbox --skip-action-cable --asset-pipeline=sprockets --skip-hotwire --skip-jbuilder
cp database.yml ./myapp/config/database.yml
cd myapp
bundle install

bundle add lesli 
bundle add lesli_admin

rake lesli:db:reset


# Start the Rails server
rails server -b 0.0.0.0
