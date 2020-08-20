#!/usr/bin/env sh

# @see http://guides.rubyonrails.org/configuring.html#configuring-a-database
# @see https://www.postgresql.org/docs/9.6/static/libpq-connect.html#AEN45527
DATABASE_URL="postgres://$(whoami)@localhost"
export DATABASE_URL

# Postgres.app - http://postgresapp.com
PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/latest/bin"
