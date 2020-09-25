#!/bin/bash

set -eu

cd "$(dirname $0)"

ECHO_TYPE="../bin/echo_type.py"

$ECHO_TYPE \# status

$ECHO_TYPE pulp status
pulp status

$ECHO_TYPE \# sync

$ECHO_TYPE pulp file remote create --name myfileremote --url https://fixtures.pulpproject.org/file/PULP_MANIFEST
pulp file remote create --name myfileremote --url https://fixtures.pulpproject.org/file/PULP_MANIFEST

$ECHO_TYPE pulp file repository create --name myfilerepo --remote myfileremote
pulp file repository create --name myfilerepo --remote myfileremote

$ECHO_TYPE pulp file repository sync --name myfilerepo
pulp file repository sync --name myfilerepo

$ECHO_TYPE pulp file repository version list --repository myfilerepo
pulp file repository version list --repository myfilerepo

$ECHO_TYPE pulp task list
pulp task list

$ECHO_TYPE \# upload

$ECHO_TYPE wget https://fixtures.pulpproject.org/file-many/4.iso
wget https://fixtures.pulpproject.org/file-many/4.iso

$ECHO_TYPE pulp artifact upload --file 4.iso
pulp artifact upload --file 4.iso

$ECHO_TYPE 'pulp artifact list --sha256 "$(sha256sum 4.iso | cut -d'"'"' '"'"' -f1)"'
pulp artifact list --sha256 "$(sha256sum 4.iso | cut -d' ' -f1)"

$ECHO_TYPE \# done!

# cleanup

pulp file repository destroy --name myfilerepo &> /dev/null
pulp file remote destroy --name myfileremote &> /dev/null
pulp orphans delete &> /dev/null
rm 4.iso &> /dev/null
