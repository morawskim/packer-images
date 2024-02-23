#!/usr/bin/env bash

set -euo pipefail

function displayUsage() {
    echo "Missing required arguments" >&2
    echo "$0 AWS_ROLE_ARN AWS_ROLE_SESSION_NAME -- restic-command-with-arguments" >&2
    exit 1
}

if [ $# -lt 4 ]; then
    displayUsage
fi

ROLE_ARN=$1
ROLE_SESSION_NAME=$2
SEPERATOR=$3
shift 3

if [ "$SEPERATOR" != "--" ]; then
    displayUsage
fi

export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
$(aws sts assume-role \
--role-arn $ROLE_ARN \
--role-session-name $ROLE_SESSION_NAME \
--duration-seconds 7200 \
--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
--output text))

COMMAND=("$@")
echo "${COMMAND[*]}"

"${COMMAND[@]}"
