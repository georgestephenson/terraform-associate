# terraform {
#   required_providers {
#     github = {
#       source  = "integrations/github"
#       version = "~> 6.0"
#     }
#   }
# }

# provider "github" {
#   token = "my_pat"
# }

# resource "github_repository" "example" {
#   name        = "example"
#   description = "My awesome codebase"

#   visibility = "public"

# }