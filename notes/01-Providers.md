# Terraform Providers Notes

- Over 5000 providers available on [Terraform Registry](https://registry.terraform.io/)
- Of course AWS is the most popular! Plus Azure, GCP, Kubernetes, Alibaba Cloud, and Oracle Cloud.

## `terraform init`

Running `terraform init` downloads plugins required for provider automatically based on your code, saved in `.terraform`.

## `provider`

We specified the provider in our `.tf` using the `provider` block.

## Issues

Providers have GitHub pages, e.g. [hashicorp/terraform-provider-aws](https://github.com/hashicorp/terraform-provider-aws). You can raise bugs and issues you find with the provider here.

## Tiers

- Official - owned and maintained by HashiCorp. Namespace of "hashicorp" under Terraform Registry.
- Partner - company with direct partnership with HashiCorp.
- Community - inidividual contributors.

Non-official providers have to be specified in `required_providers`:

``` Terraform
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {}
```

## Authentication Configuration

Don't hardcode credentials. For AWS, can point to the config and credentials files for the AWS CLI under `.aws`.

``` Terraform
provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "terraform"
}
```

However these are the default locations. So you don't really have to specify, it will do this by default if you remove these lines (however for "profile" it will use the default AWS CLI profile by default).

You could also use environment variables in your OS.

For AWS, you can use IAM roles, and other AWS-specific approaches.

## Provider Versioning

- Provider plugins separate to Terraform version, have different sets of version numbers.
- In the `required_providers` property of the terraform config, you can set the version number.

### Constraints

You can use these version number constraints to set the desired range of version numbers:

- \>= 1.0
- <= 1.0
- ~= 2.0 (any version in the 2.X range)
- \>= 2.10, <= 2.30

### `.terraform.lock.hcl`

The `.terraform.lock.hcl` file will specify the exact version of the provider that has been used. In production it's advised not to vary the exact provider version, not until you have done testing of the new version, so the lock file specifies the exact version.

Use `terraform init -upgrade` to overwrite lock file and upgrade the provider version.