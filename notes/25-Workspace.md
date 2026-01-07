# Terraform Workspace notes

- Created infrastructure is tied to Terraform configuration and state file.
- You can have multiple state files for one set of configuration files using Terraform Workspace

For example, dev.tfstate and prod.tfstate

You can use `terraform.workspace` variable to select  different values depending on environment using a map for example

A `terraform.tfstate.d` folder will get created with a folder for each created environment. Default workspace is created outside of this.