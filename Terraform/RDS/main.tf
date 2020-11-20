resource "aws_db_instance" "db-test" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "test_db"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.subnet-group-name.id
  skip_final_snapshot = true

}

resource "aws_db_instance" "db-live" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "live_db"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.subnet-group-name.id
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "subnet-group-name" {
  name       = "private-subnet"
  subnet_ids = [var.private_subnet_id, var.private_subnet_2_id]

}