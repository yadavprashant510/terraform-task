terraform {
  backend "s3" {
    bucket         = "terraform-backend510" # change this
    key            = "prashant/terraform.tfstate" # change this
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
    profile = "personal"
  }
}