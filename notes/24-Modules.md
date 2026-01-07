# Terraform Modules notes

- In larger organisations, you could have many teams with different infrastructure requirements, but some shared infrastructure
- Repeating the same code requires changing all teams code when updates happen, lack of standardisation, difficult to manage
- Terraform modules provides readymade templates to reuse code and follow DRY principles

## Choosing right modules

- Hundreds of modules by the community
- Check total downloads to see popularity
- On GitHub pages, looks for lots of contributors, avoid single contributor
- Also looks for issued that have been raised and also resolved, suggest issues found and solved.
- Look for good module documentation
- Frequent and recent version updates - regularly update
- Number of stars and forks is also a good indicator on GitHub
- Analyse the code itself to check its quality
- Modules maintained by HashiCorp partners, e.g. Google.

Most organisations maintain their own modules, perhaps based on a fork.

## Base Module Structure

- Create a base folder called "modules"
- Create sub-folder with name of each module

### Teams
- A different base folder called "teams" contains sub-folder for each of our organisation's teams.
- Each team can use different subsets of the modules.

## Module Sources

### Local Paths

A local module can be referenced with ./ or ../

``` HCL
module "ec2" {
  source = "../modules/ec2"
}
```

### Generic Git repository

A module in a git repository can be referenced using git:: prefix before the .git URL. 

### Others

There are many other sources you can install modules from, S3 buckets, Bitbucket, HTTP URL, etc.

## Versions

You can specify specific version of a module using the version attribute.

## Custom modules

- Avoid hardcoding things that will need to be configured outside the region, for example AWS region
- Recommended to use variables rather than hardcoding values in the module
- Use terraform block and "required_providers" attribute rather than "provider" block for module to work with many regions and not hardcoded to a specific region

## Module Outputs

In the same way as we can use output variables between Terraform projects, we can use outputs from Terraform modules too.

You specify `module.<MODULE NAME>.<OUTPUT NAME>`

e.g. `module.ec2.instance_id`, output variable of instance_id from module called ec2.

## Root module vs child module

- Root module is your Terraform configuration files.
- Child module is any module called within a `module` block.

## Module structure

Files within modules follow standard file naming conventions in order to make it easy to understand the module structure

Standard minimal structure:
- README.md
- main.tf
- variables.tf
- outputs.tf

More complete structure:
- modules/ - nested modules in the module
- examples/

When writing Terraform code from scratch, plan sub-modules according to requirements for different areas of architecture.

## Multiple Provider Configuration

- To have multiple providers, can specify `alias` attribute of provider, and pass alias to module.
- The main provider is inherited by usual modules and resource blocks, but the aliased provider is not inherited unless specified
  - Need to pass provider in "providers" block of module
  - In child module, specify `configuration_aliases" in the `required_providers` block.
  - Can use `provider` argument within resource blocks of the child module

``` HCL
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
      configuration_aliases = [ aws.prod ]
    }
  }
}

resource "aws_security_group" "prod" {
  name = "prod-sg"
  provider = "aws.prod"
}
```

## Publishing modules

- Public registry modules must be a public GitHub repo
- Name format `terraform-<PROVIDER>-<NAME>`