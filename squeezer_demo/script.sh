#!/bin/sh

set -eu

cd "$(dirname $0)"

ECHO_TYPE="../bin/echo_type.py"

$ECHO_TYPE cat squeezer_demo.yaml
cat squeezer_demo.yaml

$ECHO_TYPE ansible-playbook squeezer_demo.yaml
ansible-playbook squeezer_demo.yaml

$ECHO_TYPE "# Running again should be idempotent"
$ECHO_TYPE ansible-playbook squeezer_demo.yaml
ansible-playbook squeezer_demo.yaml
