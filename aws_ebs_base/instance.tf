resource "aws_instance" "example" {
  ami = "${lookup(var.AWS_AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  # the public SSH key
  key_name = "${aws_key_pair.mykey.key_name}"
}

resource "aws_ebs_volume" "ebs-example" {
  availability_zone = "${var.AWS_REGION}c"
  size = 20
  type = "gp2"

  tags {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-example-attachment" {
  device_name = "/dev/xvdh"
  volume_id = "${aws_ebs_volume.ebs-example.id}"
  instance_id = "${aws_instance.example.id}"
}
