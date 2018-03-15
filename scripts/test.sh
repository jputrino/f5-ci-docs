#!/usr/bin/env bash

set -x

: ${DOC_IMG:=f5devcentral/containthedocs:latest}

LOCAL_USER_ID=`id -u`
if [ $LOCAL_USER_ID -eq 0 ]; then
    LOCAL_USER_ID=10443
fi

exec docker run -i \
   --env-file .env \
   -v $PWD:/test --workdir /test \
   ${DOC_IMG} /bin/bash -s <<EOF
echo "Testing env import"
echo $MY_TEST_VARIABLE
EOF
