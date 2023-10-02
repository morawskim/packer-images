## Build

`bash ./fetch-images.sh`
`DOCKER_TOKEN=<docker_password_or_token> packer build box.json`

## Run

Run docker image `docker run --rm -p 8080:8080 morawskim/lorem-space-backend`

The difference between this image and [official image](https://github.com/manasky/lorem-server) is very little.
This image contains one photo, which the backend api can returns.
This allows to test integration with self-hosted lorem.space for example in package [faker-images](https://github.com/morawskim/faker-images).
In lorem.space project exists open task [to share image collection](https://github.com/manasky/lorem.space/issues/9). 
When that task will be resolve the shared photos will be added to this container image.
