#!/bin/bash
echo ""
echo "Running script with bash version: $BASH_VERSION"
GIT_ROOT=$(git rev-parse --show-toplevel)

declare -a secrets
secrets+=(".envrc")
secrets+=("config/vault.json")

echo ""
echo " #######################"
echo " ### Encrypt secrets ###"
echo " #######################"
echo ""

for secret in "${secrets[@]}";
do
    echo Encrypting $secret
    gpg --encrypt --yes --recipient jakoberpf $GIT_ROOT/$secret
done