# Intro notes

Zeal Vora gives examples of implementing AWS Hardening guidelines across many AWS accounts.

Define hardening rules in Terraform's HCL configuration files and apply directly to AWS.

## Infrastructure as Code (IaC)

- Repeatable tasks should be automated with code
- If you need the same configuration in Dev, Stage and Production, use IaC tool to deploy to each environment

Two main types of IaC tools
- Infrastructure Orchestration: Terraform, CloudFormation. For creating and manging infrastructure primarily.
- Configuration Management: Ansible, Chef. To maintain configuration of systems i.e. within servers, once the servers are already launched. Can also use Ansible to e.g. create EC2 instances.

The two types of tools have different primary purposes, they are friends however. Terraform can inform Ansible that an EC2 instance has been provisioned.