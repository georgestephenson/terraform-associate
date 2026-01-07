# Moved Blocks notes

- When you rename a resource, Terraform assumes you want to destroy the old resource with the old name and create a new resource with the new name
- You might not want this behaviour in production when just renaming local name within Terraform configuration
- You can use a `moved` block to specify a rename so no change in infrastructure will be triggered by Terraform
- Terraform will perform an "action" of moving the resource to the new resource name within the .tfstate file
- `terraform state mv` does same type of action but can be used in more complex scenarios

``` HCL
moved {
  from = aws_security_group.database_firewall
  to   = aws_security_group.payment_database_firewall
}
```