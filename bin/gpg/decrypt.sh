#!/bin/bash
echo ""
echo "Running script with bash version: $BASH_VERSION"
GIT_ROOT=$(git rev-parse --show-toplevel)

declare -a secrets
# dev
secrets+=("dev/terraform/.envrc")
secrets+=("dev/terraform/.ssh/automation.pem")
# live
secrets+=("live/terraform/.envrc")
secrets+=("live/terraform/.ssh/automation.pem")

echo ""
echo " #######################"
echo " ### Decrypt secrets ###"
echo " #######################"
echo ""

for secret in "${secrets[@]}";
do
    echo Decryping $secret
    gpg -d -o $GIT_ROOT/$secret $GIT_ROOT/$secret.gpg  
done