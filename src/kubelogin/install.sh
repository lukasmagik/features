#!/bin/sh
set -e

VERSION=${VERSION:-"latest"}

if [ "$VERSION" = "latest" ]; then
    VERSION=$(curl -s https://api.github.com/repos/int128/kubelogin/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
fi

echo "Installing kubelogin"

curl -L --output kubelogin_linux_amd64.zip https://github.com/int128/kubelogin/releases/download/$VERSION/kubelogin_linux_amd64.zip && \
unzip kubelogin_linux_amd64.zip kubelogin && \
mv ./kubelogin /usr/local/bin/kubectl-oidc_login && \
rm kubelogin_linux_amd64.zip
