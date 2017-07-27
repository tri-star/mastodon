#!/bin/sh

ln -s packs/sw.js /mastodon/public/sw.js 

bundle exec rails s -p 3000 -b '0.0.0.0'
