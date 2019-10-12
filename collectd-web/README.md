## Build

`DOCKER_TOKEN=<docker_password_or_token> packer build box.json`

## Run

Run docker image `docker run --rm -it -v <path/to/collectd/rrd>:/rrd:ro -p 80:8080 morawskim/collectd-web`

If you use `bash` you can create alias `alias collectd-web="docker run -d -it --rm -p 9988:8080 -v /var/lib/collectd/:/rrd:ro morawskim/collectd-web; xdg-open http://127.0.0.1:9988"`

And then (in new console tab) type `collectd-web`. The docker's container will start and in default web browser new page with stats dashboard will be open.
