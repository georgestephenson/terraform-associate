resource "local_file" "foo" {
  content = "foo!"
  filename = "${path.module}/foo.txt"
}

# run commands in shell:

# export TF_LOG=INFO  
# terraform plan

# export TF_LOG=TRACE
# terraform plan  

# export TF_LOG_PATH=./terraform.log
# terraform plan  