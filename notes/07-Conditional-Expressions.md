# Conditional expressions notes

- Can use conditional operator, e.g.

``` HCL
instance_type = var.environment == "development" ? "t2.micro" : "m5.large"
```

Can combine clauses with && and ||