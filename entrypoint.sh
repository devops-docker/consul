#!/bin/bash
set -e

CONSUL=/bin/consul
OPTIONS=""

if [[ ! -z $DC ]]; then
    OPTIONS="$OPTIONS -dc $DC"
fi

if [[ ! -z $JOIN ]]; then
    OPTIONS="$OPTIONS -join $SERVER"
fi

if [[ ! -z $CLUSTER_SIZE ]]; then
    OPTIONS="$OPTIONS -bootstrap-expect $CLUSTER_SIZE"
else
    OPTIONS="$OPTIONS -bootstrap"
fi

if [[ ! -z $ATLAS ]]; then
    OPTIONS="$OPTIONS -atlas-join -atlas ${ATLAS_ACCOUNT} -atlas-token ${ATLAS_TOKEN}"
fi

 
case "$1" in 

'client' ) 
    exec ${CONSUL} agent -config-dir=/config ${OPTIONS}
    ;;
'server' )
    exec ${CONSUL} agent -server -config-dir=/config ${OPTIONS}
    ;;
*)
    echo "$@"
    exec "$@"
    ;;
esac
