# Terraform Variables Notes

- Reduce need for repeated static values

Example:

``` HCL
variable "vpn_ip" {
  default = "101.0.62.210/32"
}
```

Reference in resource attribute value as `var.vpn_ip`.