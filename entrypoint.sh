#!/bin/bash
set -e

CONSUL=/bin/consul


 
case "$1" in 

'client' ) 
    exec ${CONSUL} agent -config-dir=/config
    ;;
'server' )
    exec ${CONSUL} agent -server -config-dir=/config
    ;;
*)
    echo "$@"
    exec "$@"
    ;;
esac
