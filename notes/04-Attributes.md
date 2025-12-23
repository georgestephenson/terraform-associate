# Terraform Attributes Notes

- Each resource has set of attributes
- Hold values that end up in state file

For example, elastic IP (aws_eip) has:
- ID
- public_ip
- private_ip
- private_dns

## Cross-Resource Attribute Reference

- Resource 2 may be dependent on value of Resource 1
- E.g. set SG to allow EIP even before you create and know the ID of the EIP

Within the second resource, specify attribute of the first resource:

`<RESOURCE TYPE>.<NAME>.<ATTRIBUTE>`

As part of a string

`"${<RESOURCE TYPE>.<NAME>.<ATTRIBUTE>}"`