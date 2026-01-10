# Terraform Import Notes

- An existing organisation may have many resources historically created manually
- They now want to start using Terraform, import can facilitate this

## Older approach

- Older version of Terraform import could create state file but not .tf files

## New approach

- New approach (Terraform 1.5 onwards) is that terraform import creates state file and .tf files
- You can use `import` block to specify resource to create, pointing at specified id. For example, AWS security group ID.
- You can call for example `terraform plan -generate-config-out=mysg.tf` to generate mysg.tf with all the real details of the resource
- At this stage, you can apply this .tf, which will create the state file.

``` HCL
resource "aws_s3_bucket" "example" {
  # Configuration will be added here
}

import {
  to = aws_s3_bucket.example
  id = "my-existing-bucket"
}
```