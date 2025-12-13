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