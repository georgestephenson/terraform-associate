# Terraform Resources Notes

A `resource` block in our `.tf` file specifies one or more infrastructure objects.

- In the below `resource` block, `myec2` will be the *local name* of this resource. "my-first-ec2" is the actual Name tag in AWS for this EC2 instance.
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

## Count meta-argument

- You can add count argument to resource to create that many resources (default is one resource)
- If you can't create duplicates, e.g. IAM users with the same name, then after Terraform creates the first one,

### Count.index

Each created resource when count is >1 has an index that can be referenced, e.g.

- aws_instance.myec2[0]
- aws_instance.myec2[1]
- aws_instance.myec2[2]

You can use this index as a value e.g.

```
tags = {
  Name = "payments-system-${count.index}"
}
```

You can also combine count.index with a list type variable, so that each resource takes a different value from the list.