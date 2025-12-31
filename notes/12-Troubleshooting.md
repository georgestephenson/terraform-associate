# Troubleshooting

## Terraform Troubleshooting Model

Four types of potential issues:

- Language. Syntax error with HashiCorp Language
- State. State can become out of sync, or state can be locked by another process accessing the .tfstate file.
- Core. Main Terraform application errors, bugs in `terraform` CLI. Can consult with GitHub issues page in the `hashicorp/terraform` repo to see open issues with the app.
- Provider. Errors relating to the provider plugins. Also have GitHub issues pages, e.g. `hashicorp/terraform-provider-aws`

## Reporting Bugs

Report bugs using the `hashicorp/terraform` GitHub repo issues page.