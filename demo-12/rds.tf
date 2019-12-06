resource "random_password" "rds_master_user_password" {
  length           = 32
  override_special = "!#$%&()-=~|[]{}+<>*?"
}

resource "aws_db_subnet_group" "mariadb-subnet" {
  name        = "mariadb-subnet"
  description = "RDS subnet group"
  subnet_ids  = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id]
}


resource "aws_db_parameter_group" "mariadb-parameters" {
  name        = "mariadb-parameters"
  family      = "mariadb10.1"
  description = "MariaDB parameter group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }
}

resource "aws_db_instance" "mariadb" {
  allocated_storage = 10
  engine            = "mariadb"
  engine_version    = "10.1.14"
  instance_class    = "db.t2.small"
  identifier        = "mariadb"
  name              = "mariadb"
  username          = "root"
  password          = random_password.rds_master_user_password.result

  db_subnet_group_name = aws_db_subnet_group.mariadb-subnet.name

  parameter_group_name = aws_db_parameter_group.mariadb-parameters.name

  multi_az               = "false"
  vpc_security_group_ids = [aws_security_group.allow-mariadb.id]

  storage_type = "gp2"

  backup_retention_period = 30
  availability_zone       = aws_subnet.main-private-1.availability_zone
  skip_final_snapshot     = true

  tags = {
    Name = "mariadb-instance"

  }


}
