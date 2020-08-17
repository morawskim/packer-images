## Build

`DOCKER_TOKEN=<docker_password_or_token> packer build --var docker_tag=20190914.0 box.json`

## Run

Run docker image `docker run --rm -it  morawskim/swaks -t <to@example.com> -s smtp.gmail.com:587 -tls -a <account@gmail.com> --from <account@gmail.com> --helo HELO --auth`

`docker run --rm -it  morawskim/swaks -t <to@example.com> -s smtp.gmail.com:465 -tlsc -a <account@gmail.com> --from <account@gmail.com> --helo HELO --auth`
