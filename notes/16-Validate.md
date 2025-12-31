# Terraform Validate notes

- `terraform validate` command checks if .tf files are syntactically valid.
- Will return an error with invalid lines and reason
- Will return error for undeclared input variables
- Will be called whenever you run `terraform plan` also.