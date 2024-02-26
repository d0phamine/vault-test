# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

import hvac
import sys

# Authentication
client = hvac.Client(
    url="http://127.0.0.1:8200",
    token="hvs.CAESIOn1cqfg0iblXHz1x2wIN4krbtg_wqv4s8JwSPZFFDveGh4KHGh2cy5CV0dyWU0zQ05OSUxwZmZLWGxrNGtYWE8",
)

# Writing a secret
create_response = client.secrets.kv.v2.create_or_update_secret(
    path="my-secret-password",
    secret=dict(password="Hashi123"),
)

print("Secret written successfully.")

# Reading a secret
read_response = client.secrets.kv.v2.read_secret_version(path="my-secret-password")

password = read_response["data"]["data"]["password"]

if password != "Hashi123":
    sys.exit("unexpected password")

print("Access granted!")
