resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "spring_boot" {
  ami = "${lookup(var.AWS_AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"

  provisioner "file" {
    source = "file/script.sh"
    destination = "/home/ubuntu/script.sh"
  }
  provisioner "file" {
    source = "file/nginx.conf"
    destination = "/home/ubuntu/nginx.conf"
  }
  provisioner "file" {
    source = "file/ngx_proxy.conf"
    destination = "/home/ubuntu/ngx_proxy.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/script.sh",
      "sudo /home/ubuntu/script.sh"
    ]
  }
  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
