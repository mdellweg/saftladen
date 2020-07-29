#!/bin/sh

set -eu

cd "$(dirname $0)"

ECHO_TYPE="../bin/echo_type.py"

$ECHO_TYPE http http://pulp3-sandbox-debian10/pulp/api/v3/status/
http http://pulp3-sandbox-debian10/pulp/api/v3/status/
