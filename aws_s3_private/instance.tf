resource "aws_s3_bucket" "b" {
  bucket = "my-tf-private-test-bucket"
  acl = "private"

  tags {
    Name = "My test bucket"
    Environment = "Dev"
  }
}
