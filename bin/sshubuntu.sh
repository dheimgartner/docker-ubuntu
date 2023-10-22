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
    ssh "$USER"@sshubuntu -p 2022
}

ssh_port_forward() {
    local port="$1"  # Get the port from the first argument
    ssh -L "$port":localhost:"$port" "$USER"@sshubuntu -p 2022
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
    "forward")
        if [ $# -ne 2 ]; then
            echo "Usage: $0 forward <port>"
            exit 1
        fi
        port="$2"
        ssh_port_forward "$port"
        ;;
    *)
        echo "Usage: $0 {start|attach|stop|connect|forward <port>}"
        exit 1
        ;;
esac