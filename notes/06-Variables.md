# Terraform Variables Notes

- Reduce need for repeated static values

Example:

``` HCL
variable "vpn_ip" {
  default = "101.0.62.210/32"
  description = "This is a VPN server created in AWS"
}
```

Reference in resource attribute value as `var.vpn_ip`.

- Ideally, avoid changes to main terraform resource configuration file in production. Change separate variables file/source which will update resources without changing main terraform resource file.
- Naming convention for the variables file is `variables.tf`

## Variable Definitions file (tfvars)

- HashiCorp recommends creating `*.tfvars` file to define all variable values for production.
- Useful for specifying different values for different environments, dev, stage, prod, etc. 
- So you can have `dev.tfvars`, `prod.tfvars`, etc., but all using same `variables.tf`.

So use this to deploy to different environments.

### Recommended folder structure

1. Main Terraform config file
2. `variables.tf` file to define variables
3. `terraform.tfvars` file the defines values for all variables

### Environments and naming

- Default name is `terraform.tfvars`. Terraform automatically loads values from this file. If you have a different name, you need to specify it e.g.

``` bash
terraform plan -var-file="prod.tfvars"
```

### No value specified - define in CLI

- If you define a variable without any value, Terraform will request a value in the CLI.
- You can also specifiy the value in the CLI

``` bash
terraform plan -var="instance_type=m5.large"
```

If no value, Terraform also search for TF_VAR_* environment variables, where * if the terraform variable name.

e.g. TF_VAR_instance_type