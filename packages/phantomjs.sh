#!/bin/bash
# Install a custom version of PhantomJS, http://phantomjs.org/
#
# Add at least the following environment variables to your project configuration
# (otherwise the defaults below will be used).
# * PHANTOMJS_VERSION - Specify the version of PhantomJS
# * PHANTOMJS_HOST - Specify the location of the download for the specified version
# (If you run into any rate limiting issues from bitbucket, put the download file(s) into your own
#  server/s3 bucket and point to the location of the host in PHANTOMJS_HOST)
#
# Include in your builds via
# \curl -sSL https://raw.githubusercontent.com/codeship/scripts/master/packages/phantomjs.sh | bash -s
PHANTOMJS_VERSION=${PHANTOMJS_VERSION:="1.9.8"}
PHANTOMJS_HOST=${PHANTOMJS_HOST:="https://bitbucket.org/ariya/phantomjs/downloads"}

set -e
CACHED_DOWNLOAD="${HOME}/cache/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2"

# clean old version and setup directories
rm -rf ~/.phantomjs
mkdir ~/.phantomjs
wget --continue --output-document "${CACHED_DOWNLOAD}" "${PHANTOMJS_HOST}/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2"
tar -xaf "${CACHED_DOWNLOAD}" --strip-components=1 --directory "${HOME}/.phantomjs"
