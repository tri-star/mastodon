#!/bin/sh

### 1. Adds local user (UID and GID are provided from environment variables).
### 2. Updates permissions, except for ./public/system (should be chown on previous installations).
### 3. Executes the command as that user.

echo "Creating mastodon user (UID : ${UID} and GID : ${GID})..."
addgroup -g ${GID} mastodon && adduser -h /mastodon -s /bin/sh -D -G mastodon -u ${UID} mastodon

# set -x
# echo "Updating permissions..."
# find /mastodon/log -print0 | xargs -0 chown -f mastodon:mastodon
# find /mastodon/public -name emoji -prune -o  -print0 | xargs -0 chown -f mastodon:mastodon
# chown mastodon:mastodon /mastodon/node_modules
# chown -R mastodon:mastodon /mastodon/node_modules/uws
# chown -R mastodon:mastodon /mastodon/node_modules/.bin
# find /mastodon/tmp -print0 | xargs -0 chown -f mastodon:mastodon

echo "Executing process..."
/sbin/tini -- "$@"
