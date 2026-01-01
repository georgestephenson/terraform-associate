# Terraform Block notes

Can add a Terraform block

- The block can specify required_version

``` HCL
terraform {
  required_version = "1.9.1"
}
```

- Can also add required_providers block within the terraform block, e.g. aws with version and source values.