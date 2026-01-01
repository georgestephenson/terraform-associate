# Terraform Output Values

- Request outputs from your infrastructure using Terraform
- After you create will output
- Stored in state file
- Can use for collaboration between projects in different git repos

## `terraform output`

Output command can print the output variables from the .tfstate state file.

For example if you have an output block for an output variable like so:

```
output "iam_arn" {
  value = aws_iam_user.lb[*].arn
}
```

After you apply this and it is written to the .tfstate file, you can call the command `terraform output iam_arn` to output to the terminal.