#!/bin/sh
set -e

CLI_VERSION=${CLI_VERSION:-"latest"}

if [ "$CLI_VERSION" = "latest" ]; then
    CLI_VERSION=$(curl -s https://api.github.com/repos/codefresh-io/cli-v2/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
fi


echo "Installing Codefresh CLI V2 (GitOps)"

curl -sLS --output - https://github.com/codefresh-io/cli-v2/releases/download/$CLI_VERSION/cf-linux-amd64.tar.gz | tar zx && \
mv ./cf-linux-amd64 /usr/local/bin/cf && \
cf version
