# sshubuntu

Run Ubuntu in Docker container

`make help`

In particular, port forwarding can be used to run applications in the docker container and still access it from the local machine (eventhough only one port has been mapped - the one we use to ssh into the container). This can be done by establishing an ssh tunnel when connecting... See `ssh_port_forward`. A usecase: Start the rstudio-server in the container and connect to it via the browser. Or set up an appache webserver listening on a port which can be forwarded such that it is accessible. Or a django app, or... etc.