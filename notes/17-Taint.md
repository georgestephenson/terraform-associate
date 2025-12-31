# Terraform Taint notes

- When lots of manual changes made to a resource created in Terraform, two options:
  - Import changes to Terraform
  - Delete & Recreate resource

Use `terraform apply -replace="xyz"` to force Terraform to replace an object even though not required by configuration changes

E.g. `terraform apply -replace="aws_instance.web"`

Note: this has replaced `terraform taint` command in Terraform v0.15.2 and later.