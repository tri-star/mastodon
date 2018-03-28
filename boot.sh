#!/bin/sh


LINK=/mastodon/public/assets
test -d $LINK && test ! -L $LINK && rm -rf $LINK
ln -sf /volumes/mastodon-assets/assets $LINK

LINK=/mastodon/public/packs
test -d $LINK && test ! -L $LINK && rm -rf $LINK
ln -sf /volumes/mastodon-assets/packs $LINK

$@