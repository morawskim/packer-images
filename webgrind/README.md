## Build

`DOCKER_TOKEN=<docker_password_or_token> packer build --var docker_tag=<VERSION> box.json`

## Run

Run docker image `docker run --rm -it -p 8080:8080 -v /path/cachegrind.out.18:/tmp/cachegrind.out.18 morawskim/webgrind`

