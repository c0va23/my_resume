#!/bin/sh

set -e

rake db:migrate

exec "$@"
