# State Notes

## State File

- Terraform state file keeps track of created resources
- e.g. EC2 instance gets created by terraform apply, state file tracks instance ID etc.
- So if we change t2.micro to t2.medium, we can track which instance to modify.
- The file is called `terraform.tfstate` and is a JSON file.

## Desired State vs Current State

- Desired state is written in `.tf` config files.
- Current state is what actually currently exists. 
- Things might get modified manually in between running `terraform apply`.

### Reconciliation process

1. When you run apply or plan, Terraform calls Cloud Provider API to check on state of infrastructure.
2. Compares current state found with desired state in .tf files.
3. Determines action needed to reconcile states.

## Actions

- Create - if desired but not current
- Update - desired and currently exists, but have differences in properties
- Delete - current exists but has been removed from desired (according to .tfstate)
- No-Op - current matches desired

## Default values

- If there's properties we don't specify for an EC2 instance, e.g. storage size and security group, AWS will use default values.
- When you `terraform plan` those properties that aren't specified will say "(known after apply)", because AWS will set them after terraform runs commands to apply.
- Defaults could be affected by many different things, AWS region, org, account, user or group or role policy, so this is why it can't be known until after apply.
- Default values are **not** desired state. If you make manual changes to default values, they will not be reverted by Terraform.

Best practice is to minimise default value attributes and explicitly define all attributes.

## `terraform refresh`

The `terraform refresh` command will update the state files according to manual changes to the infrastructure.

This also gets runs whenever you run plan or apply commands. Typically you won't need to run it manually.

Deprecated in newer versions of Terraform, `-refresh-only` added to plan and apply instead.