#!/bin/bash

echo "Derleme işlemi başladı"

# bin/rails db:migrate RAILS_ENV=development
bin/rails db:drop && bin/rails db:create && bin/rails db:migrate && bin/rails db:seed

cp /etc/hosts /etc/hosts.new &&
  sed -i 's/::1\tlocalhost ip6-localhost ip6-loopback/::1 ip6-localhost ip6-loopback/' /etc/hosts.new &&
  cp -f /etc/hosts.new /etc/hosts

if [ -f "/app/tmp/pids/server.pid" ]; then
  echo "Dosya mevcutta var ve silinecek"
  rm -f /app/tmp/pids/server.pid
fi

bundle exec rails server -u puma -p 3000 -b '0.0.0.0'
