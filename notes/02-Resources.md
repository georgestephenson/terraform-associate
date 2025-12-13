# Terraform Resources Notes

A `resource` block in our `.tf` file specifies one or more infrastructure objects.

- In the below `resource` block, `myec2` will be the local name of this resource. "my-first-ec2" is the actual Name tag in AWS for this EC2 instance.
- The type of "aws_instance" and name of "myec2" is the unique identifier for this resource.

``` Terraform
resource "aws_instance" "myec2" {
  ami = "ami-068c0051b15cdb816"
  instance_type = "t3.micro"

  tags = {
    Name = "my-first-ec2"
  }
}
```

## `terraform destroy`

The `terraform destroy` command will destroy all the resources created.

`-target` option allows you to focus on a subset of resources, using the pattern `resource_type.resource_name`