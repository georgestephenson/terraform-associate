# Local values

Similar to variables but can define local values to be reused rather than repeating them throughout the file.

``` HCL
locals {
  tags = {
    Team = "security-team"
  }
}
```

You would call this value using `local.tags`. So plural `locals` for the section, singular `local` for the value.

However, locals can be computed using expressions, which variables cannot do. For example you can use Terraform functions in your expressions. This would be one of the main use cases for locals.