# Remote State Management Notes

## Storing .tfstate in git

- Recommendation is DON'T store .tfstate file in git
- May contain secrets

## .gitignore

You shouldn't commit

- .terraform folder
- terraform.tfvars if its contains sensitive info
- .tfstate files
- crash.log
- saved plan files when you do `terraform plan -out`

## Backends

- Where Terraform stores state file
- The default local backend stores terraform.tfstate in the same project folder

### Challenges

- Local .tfstate file doesn't work for team collaboration
- A central backend is recommended (in addition to git repo with .tf files)

A wide variety of remotes backends are supported by Terraform

- consul
- s3
- azurerm
- gcs

We want to store .tfstate in remote backend with encryption

The local backend is used by default but can also be explicitly defined

``` HCL
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}
```

### Credentials

Remote backend will generally also require some credentials to access. Different authentication methods for each backend service.

## State locking

- Concurrent changes to state files by different users can lead to corruption of the file
- State locking avoids this by acquiring locks on the state file
- With local backend, Terraform uses a .lock file (.tfstate.lock.info). 
- If state file is locked other users will get an error
- Can use S3 bucket as backend, specify to use lock file or not

## State management

- In advanced cases, uses `terraform state` to change the state file

### Commands

- `terraform state list` list resources in state file
- `terraform state show` show attributes of a resource in state file. Can be useful to get resource attributes without needing to e.g. open up the AWS console to go and manually find the created resource
- `terraform state pull` pull the state from a remote backend and output to stdout
- `terraform state rm` remove resource from state file without destroying it (you want to keep the resource live but don't want to maintain it in Terraform anymore)
- `terraform state mv` live the `moved` block, rename item in state
- `terraform state replace-provider` to replace provider in state file. You might have a fork of a provider with modifications.

## Cross-team collaboration

- One team might want to connect to remote backend state file of another team, to access information on the infrastructure, e.g. IP addresses