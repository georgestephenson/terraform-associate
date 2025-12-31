# Terraform Plan notes

## Plan file

You can run the apply command against a file consisting of a prior generate plan.

``` bash
terraform apply xyz.plan
```

This can ensure consistent infrastructure state based on a known plan.

- Organisation may require documented proof of planned changes prior to applying them in the implementation, to be reviewed and approved.

Can output plan using `terraform plan -output xyz.plan`

- The `.plan` file is a binary file, not human-readable
- However you can run `terraform show -json xyz.plan` to show the plan in JSON format, making it human-readable

``` bash
terraform show -json xyz.plan | jq
```