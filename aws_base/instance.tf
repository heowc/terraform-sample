resource "aws_instance" "example" {
  ami = "ami-ab77d4c5"
  instance_type = "t2.micro"
}
