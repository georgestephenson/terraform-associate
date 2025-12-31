resource "local_file" "foo" {
  content = "foo!"
  filename = "foo.txt"
}

# run commands:
# ``` bash
# terraform plan -out xyz.plan
# terraform apply xyz.plan
# ```
# creates foo.txt

# ```
# terraform show -json xyz.plan | jq
# ```
# 
# outputs plan in JSON