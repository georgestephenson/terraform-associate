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

## Resource Tagging

You can call `terraform plan` against a specific resource in a specific file:

``` HCL
terraform plan -target local_file.foo
```

This will only update the plan for the resource foo in local_file.

Use case: if you have work in progress changes across 10 resources, so you can't apply all the changes yet. But you need to fix one resource issue.

There could be issues such as network failure, upstream cloud platform, or a bug in Terraform meaning a specific resource is out of sync and has issues. Resource tagging can be useful to troubleshoot errors.