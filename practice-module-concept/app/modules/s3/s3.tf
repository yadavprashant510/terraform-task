resource "aws_s3_bucket" "my_bucket" {
  bucket = var.s3_bucket_name
  tags = {
    Name = var.s3_bucket_name
    Environment = "Development"
  }
}

resource "aws_s3_object" "test_object" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "my-tf-test-bucket-9702466709/terraform.tfstate"
  source = "terraform.tfstate"
  tags = {
    Name        = var.s3_bucket_name
    Environment = "Development"
  }
}