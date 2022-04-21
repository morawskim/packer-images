## Build

```
DOCKER_TOKEN=<docker_password_or_token> packer build box.json
```

## Run docker image

```
docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it morawskim/opensuse-leap-debug
``
