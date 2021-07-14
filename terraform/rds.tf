data "aws_subnet_ids" "database_subnet_ids" {
  depends_on = [module.vpc]
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "db_rule_in" {
  from_port = 5432
  protocol = "tcp"
  security_group_id = aws_security_group.db_sg.id
  cidr_blocks = ["0.0.0.0/0"]
  to_port = 5432
  type = "ingress"
}

resource "aws_security_group_rule" "db_rule_out" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.db_sg.id
}

resource "aws_db_subnet_group" "db_sub_group" {
  name       = "${var.project}-db-net"
  subnet_ids = tolist(data.aws_subnet_ids.database_subnet_ids.ids)

  tags = {
    Name = "${var.project}-db-net"
  }
}


resource "aws_db_instance" "postgresql" {
  allocated_storage               = var.database_storage
  engine                          = "postgres"
  engine_version                  = var.engine_version
  instance_class                  = var.database_type
  name                            = var.database_name
  password                        = var.database_password
  username                        = var.database_username
  port                            = var.database_port
  vpc_security_group_ids          = [aws_security_group.db_sg.id]
  db_subnet_group_name            = aws_db_subnet_group.db_sub_group.id
  publicly_accessible = true

  tags = merge(
    {
      Name        = "${var.project}-db"
    }
  )
}