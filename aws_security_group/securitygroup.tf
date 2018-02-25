data "aws_ip_ranges" "korea_ec2" {
  regions = [ "ap-northeast-2" ]
  services = [ "ec2" ]
}

resource "aws_security_group" "from_korea" {
  name = "from_korea"

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = [ "${data.aws_ip_ranges.korea_ec2.cidr_blocks}" ]
  }
  tags {
    CreateDate = "${data.aws_ip_ranges.korea_ec2.create_date}"
    SyncToken = "${data.aws_ip_ranges.korea_ec2.sync_token}"
  }

}
