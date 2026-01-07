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
- If you can't create duplicates, e.g. IAM users with the same name, then after Terraform creates the first one, you will get an error after that. So the first will be created but no duplicates are created.

The count attribute can be added like so:

``` HCL
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}
```

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

### Challenges with count

Mapping variable to a count of resources can have unpredictable results. E.g. a variable list of EC2 instance names. Adding to the end of the result will create the new resource with the new name as expected, but adding a name to the start of the list will end up trying to change all the names of all the existing elements, and will error due to unique constraints.

- If resources are almost identical, you can use count
- Otherwise when distinct values needed, it's better to use for_each

## Resource behaviour

Depending on nature of update, for example to an EC2 instance, Terraform may update the instance in place or destroy and recreate the resource.

For example changing the AMI of an EC2 instance. You will get a warning e.g. "aws_instance.myec2 must be replace"

## Meta-argument

There are multiple meta-arguments than can be added to a resource block to change its meta-behaviour (how Terraform will deal with changing the resource, rather than the specific changes)

We've already seen `count` and `for_each`.

- depends_on
- count
- for_each
- lifecycle
- provider

### Lifecycle

Allow a certain level of manual customisation to a resource without overwriting changes based on Terraform maintaining a consistent state.

E.g. within a EC2 instance resource block

```
resource "aws_instance" "myec2" {
  ami = ...
  instance_type = "t3.micro"

  lifecycle {
    ignore_changes = [tags]
  }
}
```

This will ignore any changes that happen to the tags of the instance.

In total, there are four arguments avaiable within the lifecycle block

- create_before_destroy, true/false, new object created before old object destroyed (when forced to by updates)
- prevent_destroy, true/false, don't allow terraform plans that would destroy any objects, and won't allow terraform destroy either. Will return an error in these cases. Note that removing the whole resource block will still destroy that resource, as the meta-argument was also removed.
- ignore_changes, as above, ignore specific changes to live objects. Can provide a list or attributes, or the special keyword `all` to ignore all attributes. This will allow create or destroy on resources but never update.
- replace_triggered_by, replace object when specified items change

#### Preconditions and Postconditions

Also available within the lifecycle block are `precondition` and `postcondition`. It allows you to run some logic before or after evaluating an object.

For example, launch EC2 instance only if eligible for free tier. This is dependent on it being certain instance_types. Provider will give these attributes

``` HCL
data "aws_ec2_instance_type" "example" {
  instance_type = "t3.micro"
}

output "instance_type" {
  value = data.aws_ec2_instance_type.example.free_tier_eligible
}



resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = "ami-066784287e358dad1"

  lifecycle {

    precondition {
      condition = data.aws_ec2_instance_type.example.free_tier_eligible
      error_message = "Instance Type is not part of free tier"
    }

    postcondition {
      condition = self.public_dns == ""
      error_message = "Public IPV4 or DNS is mandatory for this server"
    }
  }
}
```

The "self" variable is only available in postcondition as it's available after instance is launched.

- Precondition prevents creation/update
- Postcondition will prevent further changes after postcondition triggered by creation/update. But you can destroy the resource.
- Available in Terraform v1.2.0 or later

## Resource dependencies

- For example, need an S3 bucket to store some data before you can create an EC2 instance
- `depends_on` meta-argument will take a list of resources that a resource depends on, so that those dependencies will have all actions performed on them first

``` HCL
depends_on = [aws_s3_bucket.example]
```

But during `terraform destroy`, the order is reversed so that resources aren't broken by having their dependencies destroyed.

### Implicit vs. Explicit Dependencies

Explicit dependencies declared with `depends_on` as above.

Implicit dependencies will be made by utilising references within attributes. For example if you have an EC2 instance that depends on a security group, set the EC2 instance security groups with the `vpc_security_group_ids` attribute.

That attribute takes an ID. You can use a hardcoded ID string, but in order to benefit from implicit dependencies, use the aws_security_group.local_name_here.id attribute.

## for_each

If for_each meta argument value is a map of set of string, Terraform create one instance for each member of map/set

``` HCL
variable "user_names" {
  type = set(string)
  default = ["alice","bob","john"]
}

resource "aws_iam_user" "this" {
  for_each = var.user_names
  name = each.value
}
```

When we use a map, then we can use both `each.key` and `each.value`