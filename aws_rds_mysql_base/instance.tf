resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "standard"
  engine               = "mysql"
  engine_version       = "5.6.37"
  instance_class       = "db.t2.micro"
  name                 = "terraform_mysql"
  username             = "terraform"
  password             = "terraform_password"
  skip_final_snapshot  = true
}
/* skip_final_snapshot = false */
