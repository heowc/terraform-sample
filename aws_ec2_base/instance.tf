resource "aws_instance" "example" {
  ami = "${lookup(var.AWS_AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
}
