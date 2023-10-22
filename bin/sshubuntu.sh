#!/bin/bash

CONTAINER="sshubuntu"
USER="sshuser"

start_container() {
    docker start "$CONTAINER"
}

attach_container() {
    docker exec -u "$USER" -it "$CONTAINER" /bin/bash
}

stop_container() {
    docker stop "$CONTAINER"
}

ssh_connect() {
    ssh "$USER"@localhost -p 2022
}

case "$1" in
    "start")
        start_container
        ;;
    "attach")
        attach_container
        ;;
    "stop")
        stop_container
        ;;
    "connect")
        ssh_connect
        ;;
    *)
        echo "Usage: $0 {start|attach|stop|connect}"
        exit 1
        ;;
esac