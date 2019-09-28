## Build

`DOCKER_TOKEN=<docker_password_or_token> packer build box.json`

## Run

Run X server in background `Xephyr :1 -ac -br -noreset -screen 1366x768 &`

Run docker image `docker run -v /tmp/.X11-unix:/tmp/.X11-unix --rm morawskim/opensuse-leap-kde5-devel`
