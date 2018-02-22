variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "ap-northeast-2"
}
variable "AWS_AMIS" {
  type = "map"
  default = {
    ap-northeast-2 = "ami-ab77d4c5"
  }
}
