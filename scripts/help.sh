#!/bin/bash

show_help() {
    cat <<EOM
Usage: make [TARGET]

Targets:

  make install:
    Creates the image and container from the 'Dockerfile'.
    Some stuff is still hardcoded -> in a future version these
    vars should be source from 'config.env'!

  make rm:
    Removes the container (but not the image)...

  make help:
    Prints this help text.

>>> Check out the bin/sshubuntu.sh script (and add it to your path)
EOM
}

show_help