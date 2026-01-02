# Terraform Provisioners notes

This topic is removed from the exam but still useful info about Terraform.

- As well as creating infrastructure, organisations would like an end-to-end solution for configuring infrastructure and applications.
- Provisioners execute scripts on local or remote machine after resource create/destroy.
- E.g. install software on VM.

Two major type of provisioner:
- local-exec. Invoke local executable after creating a resource.
- remote-exec. Invoke script or run command on remote server.

There are also file provisioners but this is left out of scope for now.

## Defining Provisioners

- Defined within resource block, specifying local-exec or remote-exec

``` HCL
resource "aws_instance" "myec2" {
  # ...

  provisioner "local-exec" {}
  
  provisioner "remote-exec" {}
}
```

`local-exec` requires a command to run

``` HCL
provisioner "local-exec" {
  command = "local command here"
}
```

`remote-exec` will also need a `connection` block. You can specify multiple inline commands in the `remote-exec` block with the `inline` attribute and a list of strings.

## Points to note

- Common example is using this with EC2 instances/VMs, but notes that provisioners can be used with any resource block type.
- You could have multiple local-exec provisioners within one resource block

## Create time vs Destroy time

- By default provisioners run during creation of resource, not at update time or any other time.
- You can add `when = destroy` attribute to `local-exec` provisioner, which will run commands immediately before the resource is destroyed.
- Use case example: remove and de-link antivirus software before EC2 instance is terminated.

## Tainting resource in creation-time provisioner

- If creation-time provisioner fails, resource is tainted.
- Tainted resource will be planned for destruction and recreation upon next Terraform apply, rather than leave it in a semi-configured state.

This happens by default - if the provisioner fails then the resource fails. However, there is an `on_failure` setting which can be set to `continue` optionally. By default this is set to `fail`.