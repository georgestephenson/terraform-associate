# Data Sources notes

Allow Terraform to fetch information from external data sources.

- Start by defining Data Source Block from e.g. AWS EC2 details.
- Passes information to Resource Block internally.

e.g. in .tf file

```
data "digitalocean_account" "example" {}
```

Get digitalocean account information from digitalocean provider, with account key passed in to provider.

Information fetched into terraform.tfstate file

### Reading files

The data source block can also be used to read a file

``` HCL
data "local_file" "foo" {
  filename = "${path.module}/demo.txt"
}
```

Again it will be stored as a resource of type local_file called foo in the terraform.tfstate file.

path.module will return current directory of the code being executed.

### Fetch EC2 instance details

You could call the following to fetch all EC2 instance details in a region

``` HCL
data "aws_instances" "example" {}
```

## Documentation 

In the HashiCorp Terraform Registry, as well documentation on resources there is documentation on data sources for the various providers and services, e.g. AWS EC2.

The documentation will detail arguments for the "data" block and returned attributes exported to the .tfstate file.

## Filters

Within a data block you can specify a filter block to query specific data

## Fetching latest OS image

- Common use case for Terraform data source, get latest OS AMI image
- Same AMI image has different AMI ID in each region
- Can use AMI Data Source to fetch AMI ID in the specified region