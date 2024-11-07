#!/bin/sh
set -e

CLI_VERSION=${CLI_VERSION:-"latest"}

if [ "$CLI_VERSION" = "latest" ]; then
    CLI_VERSION=$(curl -s https://api.github.com/repos/codefresh-io/cli/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
fi

echo "Installing Codefresh CLI V1 (Pipelines)"

curl -sLS --output - https://github.com/codefresh-io/cli/releases/download/$CLI_VERSION/codefresh-$CLI_VERSION-linux-x64.tar.gz | tar zxf - codefresh && \
mv ./codefresh /usr/local/bin/codefresh && \
codefresh version
