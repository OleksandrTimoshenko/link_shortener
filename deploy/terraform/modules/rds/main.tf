data "aws_vpc" "default" {
  default = true
}

resource "random_string" "rds-db-password" {
  length  = 32
  upper   = true
  number  = true
  special = false
}

resource "aws_security_group" "db_sg" {
  vpc_id      = "${data.aws_vpc.default.id}"
  name        = "db_sg"
  description = "Allow all inbound for Postgres"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "db-rds" {
  identifier             = "db-rds"
  name                   = var.db_name
  instance_class         = "db.t2.micro"
  allocated_storage      = 5
  engine                 = var.engine
  engine_version         = var.engine_version
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  port                   = 5432
  username               = var.db_user
  password               = var.db_password
}