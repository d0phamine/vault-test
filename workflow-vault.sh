#!/usr/bin/env bash

# Start vault
# vault server -config /vault/config/vault-config.hcl

echo 1

# Export values
export VAULT_ADDR='http://0.0.0.0:8201'
export VAULT_SKIP_VERIFY='true'

echo 2

# Parse unsealed keys
mapfile -t keyArray < generated_keys.txt

# echo ${keyArray[3]}

vault operator unseal ${keyArray[3]}

echo 4
# Get root token
mapfile -t rootToken < generated_keys.txt
echo ${rootToken[1]} > root_token.txt

export VAULT_TOKEN=${rootToken[1A]}

echo 5

# Enable kv
vault secrets enable -version=1 kv

# Enable userpass and add default user
vault auth enable userpass
vault policy write spring-policy spring-policy.hcl
vault write auth/userpass/users/admin password=${SECRET_PASS} policies=spring-policy

# Add test value to my-secret
vault kv put kv/my-secret my-value=s3cr3t