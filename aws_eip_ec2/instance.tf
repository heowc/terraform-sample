resource "aws_instance" "example" {
  ami = "${lookup(var.AWS_AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
}

resource "aws_eip" "example-eip" {
  instance = "${aws_instance.example.id}"
  vpc = true
}
