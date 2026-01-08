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
