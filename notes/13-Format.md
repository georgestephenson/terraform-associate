# Terraform Format notes

- `terraform fmt` command will auto-format .tf files to have consistent formatting
- No need for parameters or inputs, `terraform fmt` alone will auto-update files in directory
- Does not change behaviour of code

## Flags

- `-diff` will show what changes will be made by running the `fmt` command.
- `-recursive` flag will format all files in subdirectories. By default `fmt` only looks in current directory.
- `-check` will return 0 if all files formatted correctly, and 3 if any files require formatting. Useful for CI/CD pipelines to check correct formatting without modification.