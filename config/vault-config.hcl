// Filesystem storage
storage "file" {
  path = "./vault/data"
}

// TCP Listener
listener "tcp" {
  address = "0.0.0.0:8201"
  tls_disable = "true"
}

disable_mlock = true

api_addr = "http://0.0.0.0:8200"
cluster_addr = "http://0.0.0.0:8201"
ui = true