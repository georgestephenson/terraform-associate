# HashiCorp Cloud Platform Notes

- GUI for Terraform available through HCP Terraform
- Workspaces for each project
- "Run List" of plans, outputs, applys
- Auto-triggered runs from repo stored in GitHub. So CI/CD
- Stores the state file securely
- Sentinel - policy as code tool to enforce policies on your Terraform infrastructure

## Pricing

- Different tiers
  - Essentials
  - Standard
  - Premium
  - Enterprise

Audit logging, drift detection, continuous validation not in essential

Policy as code (Sentinel/OPA) limited in essential plan

Air Gap only on Enterprise

Standard Edition and above has team management

## Payment methods

- Pay-As-You-Go (PAYG) on-demand
- Flex, single and multi-year plans
- Enterprice Self Managed, fully custom plan

## Organisations

- Shared space for collaboration between one or more teams

## Workspace

- Workspace replaces the project "folder" containing all our Terraform files

### Workflow types

- Version Control Workflow, probably most common for organisations to manage via source control
- CLI-Driven Workflow, in your local .tf, specify cloud and workspaces block, and you can remotely trigger runs, so your Terraform CLI commands like `terraform apply` will be fully executed remotely in HCP, using the HCP version of Terraform
- API-Driven Workflow

## Projects

- Many workspaces, teams, tags

## Teams

- Groups of users
- By default, owners team is the default team of HCP org. This has all permissions. Create restricted team access as best practice.

### Workspace Permission Groups

When adding team to workspace, control what the team can do in that workspace

- Read
- Plan
- Write
- Admin
- Custom

Also can set custom permissions for finer grain control

## Sentinel

- Policy as code tool integrated with HashiCorp products
- Policies are attached to policy sets, which can be associated with HCP Terraform workspace
- Paid feature
- Enforcement settings, hard mandatory or soft
- e.g. check EC2 has tags, or check 0.0.0.0/0 is not enabled
- Sentinel checks happen after plan stage, before apply
- Sentinel is a proactive service.

## Air Gapped Environment

- Air Gap is a network security measure that physically isolates a network from unsecured/public networks
- Terraform Enterprise can be installed online, or air gapped on isolated server

## HCP Terraform Private Registry

- Share Terraform providers and modules privately across your organisation
- Still can use GitHub as repo for providers/modules though (public or private)
- You can publish new version of modules within HCP

## Health Assessments

- HCP can do automatic health assessments in workspace
- These are available in Standard or Premium HCP

### Drift detection

- Check if real-world infrastructure matches Terraform config

### Continuous validation

- Check custom conditions pass after Terraform applies changes. E.g, check response from website for health check.

## Run Triggers

- With remote date sources between teams, one team doesn't know if infrastructure of other team has changed
- HCP can use run triggers to automatically trigger another workspace to run if it's dependent on another of your workspaces
- Need to enable "remote state sharing" in the source workspace, and designate dependent workspace
- Then set run triggers "connected workspaces"
- Recommended to use "tfe_outputs" data source for access to Terraform Enterprise or HCP workspaces

## Migrate State

- HCP Terraform stores previous state file version, so full state history
- Can do rollbacks and it is secure
- You can migrate local or remote state files to HCP Terraform

1. Add "cloud" block in terraform block specifying HCP TF workspace
2. Do a `terraform login` to get authenticate with HCP
3. Do `terraform init` to migrate state to HCP Terraform, it will ask you if you want to do this. If versions of terraform differ, use `-ignore-remote-version` flag.

Always backup before migration.

Use `-migrate-state` flag to automate without asking if we're sure.

## Choosing versions

- You can choose versions of Terraform in HCP, in your workspace
- So it will be compatible with existing projects which you might migrate in.