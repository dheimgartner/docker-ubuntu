#!/bin/bash

CONTAINER="sshubuntu"
IMG_NAME="img-$CONTAINER"

# Creating ssh key-pair
echo "creating ssh key-pair..."

if [ -d "./ssh" ]; then
    echo "ssh directory exists..."
else
    echo "creating ssh directory..."
    mkdir ssh
fi

ssh-keygen -t ed25519 -C "d.heimgartners@gmail.com" -f ssh/$CONTAINER -N ""

eval "$(ssh-agent -s)"

ssh-add ./ssh/$CONTAINER

echo "copying the keys to ~/.ssh"
cp -r ./ssh/* ~/.ssh/

# Build image
docker build -t $IMG_NAME .

# Build container
docker create -it -p 2022:22 --name $CONTAINER $IMG_NAME

# Add to sudoers and change password
docker start $CONTAINER

docker exec -it $CONTAINER usermod -aG sudo sshuser
docker exec -it $CONTAINER sudo passwd sshuser

docker stop $CONTAINER