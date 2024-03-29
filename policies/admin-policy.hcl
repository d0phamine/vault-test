# Configure auth methods
path "sys/auth" {
  capabilities = [ "create", "update", "read", "delete", "list" ]
}

# Configure auth methods
path "sys/auth/*" {
  capabilities = [ "create", "update", "read", "delete", "list", "sudo" ]
}

# Manage userpass auth methods
path "auth/userpass/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

path "sys/mounts/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# Manage github auth methods
path "auth/github/*" {
  capabilities = [ "create", "read", "update", "delete" ]
}

# Display the Policies tab in UI
path "sys/policies" {
  capabilities = [ "read", "list" ]
}

# Create and manage ACL policies from UI
path "sys/policies/acl/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# Create and manage policies
path "sys/policies/acl" {
  capabilities = [ "read", "list" ]
}

# Create and manage policies
path "sys/policies/acl/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# List available secrets engines to retrieve accessor ID
path "sys/mounts" {
  capabilities = [ "read" ]
}

# Create and manage entities and groups
path "identity/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

path "kv/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "kv/data/my-secret-password" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}