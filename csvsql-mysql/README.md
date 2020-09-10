## Build

`DOCKER_TOKEN=<docker_password_or_token> packer build --var docker_tag=1.0.5 box.json`

## Run

Run docker image `docker run --rm -it --network=NETWORK_NAME -v$PWD/:/app/file.csv  morawskim/csvsql-mysql --db 'mysql+pymysql://username:password@HOST:PORT/DB_NAME' --insert /app/file.csv`

docker-compose service:

```
csvkit:
    image: morawskim/csvsql-mysql:1.0.5
    volumes:
        - ./:/app
```

`docker-compose run csvkit --db 'mysql+pymysql://<DB_USER>:<DB_PASSWORD>@<DB_HOST>:3306/<DB_NAME>' --insert /app/<CSV_FILE>`
