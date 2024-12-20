
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-9702466709"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "example_object" {
  bucket                            = aws_s3_bucket.example.id
  key                               = "my-tf-test-bucket-9702466709/terraform.tfstate"
  source                            = "terraform.tfstate"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }


}