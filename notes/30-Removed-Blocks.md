# Removed Blocks Notes

- You have a resource in Terraform, but no longer want to manage it in Terraform
- You still want the resource to exist, so you don't want Terraform to destroy it if you remove it from the .tf file
- Old approach would have been `terraform state rm aws_instance.example` command to remove from .tfstate file
- Downside is that this is imperative and a human-run command, can't be version controlled in Git, less clear audit and not clear how to do through CI/CD pipeline
- New approach: `removed` block

``` HCL
removed {
  from = aws_instance.myec2

  lifecycle {
    destroy = false
  }
}
```

`destroy = false` means remove from .tfstate file but don't destroy the resource.