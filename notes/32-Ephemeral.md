# Ephemeral Notes

- Ephemeral block defines temporary resources
- Not stored in state or plan files
- `resource "random_password"` vs. `ephemeral "random_password"`
- Can't use ephemeral value in output block

AWS resources could provide `password` which is stored in state file, and `password_wo` which is write only and doesnt store the value, but used with `password_wo_version` to increment the version of the password

You could send this password to a secrets manager, e.g. "aws_secretsmanager_secret", and use `aws_secretsmanager_secret_version.secret_string_wo` to set this write-only variable