#!/bin/sh
set -e

git clone https://github.com/wikimedia/mediawiki-extensions-CheckUser /github

exec "$@"
