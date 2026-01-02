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