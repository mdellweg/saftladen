#!/bin/sh

./echo_type cat squeezer_demo.yaml
cat squeezer_demo.yaml

./echo_type ansible-playbook squeezer_demo.yaml
ansible-playbook squeezer_demo.yaml

./echo_type "# Running again should be idempotent"
./echo_type ansible-playbook squeezer_demo.yaml
ansible-playbook squeezer_demo.yaml
