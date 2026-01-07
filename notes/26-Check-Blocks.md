# Check Blocks notes

- Validate infrastructure outside of resource lifecycle (remember precondition and postcondition was in the resource lifecycle block)
- By default, if data source block fails, then the whole Terraform plan/apply fails
- You can nest a data block inside a check block. This will return a warning instead of an error
- The `check` block must has at least one `assert` block with condition that must pass or else there is a warning.

``` HCL
check "website_checker" {
   data "http" "example" {
      url = "https://google1231233dsd.com"
   }

   assert {
     condition = data.http.example.status_code == 200
     error_message = "Website is not running. Please check"
   }
}
```

- Could use check block to check AWS budget limits. Not necessarily directly related to resources, but to data source
- Useful for continuous validation of infrastructure
- HCP Terraform application can use check block to monitor with continous validation dashboard