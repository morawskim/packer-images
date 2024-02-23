# restic-aws-backup

The image contains following tools:
* mysqldump
* restic
* pigz
* awscli

All these tools are helpful to create backups of MySQL database and store it in AWS S3.

Additional a bash script `aws-assume-role.sh` exists which helps  retrieve temporary AWS credentials.
Usage `aws-assume-role.sh AWS_ROLE_ARN AWS_ROLE_SESSION_NAME -- restic-command-with-arguments`

## Build

`make build`
`DOCKER_TOKEN=<docker_password_or_token> packer build --var docker_tag=<TAG> box.json`
