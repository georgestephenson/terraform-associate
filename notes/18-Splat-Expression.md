# Splat expression notes

Splat expression can be used to get a list of attributes based on list of strings matching expression

``` HCL
resource "aws_iam_user" "lb" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns" {
  value = aws_iam_user.lb[*].arn
}
```

The count attribute creates multiple resources named lb[0], lb[1], and he splat expression lb[*] matches all these resources.