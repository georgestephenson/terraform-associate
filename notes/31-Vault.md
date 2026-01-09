# Vault Notes

- HashiCorp Vault allows securely storing secrets
- Dynamic secrets - can be used to e.g. generate AWS credentials that are temporary
- Can encrypt and decrypt data

## Vault Provider

- Terraform provides Vault provider
- Can be use to read from and write to and configure Vault

For example, getting data for a DB from Vault using a data source block

``` HCL 
provider "vault" {
  address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "demo" {
  path = "secret/db-creds"
}
```

Then you can use sensitive output block to get values