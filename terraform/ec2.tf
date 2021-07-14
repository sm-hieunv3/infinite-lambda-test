locals {
  ingress_rules = [
    {
      description = "ssh",
      from_port   = 22,
      to_port     = 22,
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "jenkins",
      from_port   = 8080,
      to_port     = 8080,
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

resource "aws_key_pair" "cicd_key_pair" {
  key_name   = "${var.project}_key"
  public_key = var.public_key
}

resource "aws_security_group" "cicd_sg" {
  name        = "cicd_sg"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "cicd_rule_in" {

  count             = length(local.ingress_rules)
  description       = lookup(local.ingress_rules[count.index], "description")
  from_port         = lookup(local.ingress_rules[count.index], "from_port")
  to_port           = lookup(local.ingress_rules[count.index], "to_port")
  protocol          = lookup(local.ingress_rules[count.index], "protocol")
  cidr_blocks       = lookup(local.ingress_rules[count.index], "cidr_blocks")
  security_group_id = aws_security_group.cicd_sg.id
  type = "ingress"
}

resource "aws_security_group_rule" "cicd_rule_out" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.cicd_sg.id
}

data aws_subnet "cicd_subnet_id"{
  depends_on = [module.vpc]
  vpc_id = module.vpc.vpc_id
  filter {
    name = "cidr-block"
    values = ["${var.cicd_subnet}"]
  }
}

resource "aws_instance" "cicd" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id  =  data.aws_subnet.cicd_subnet_id.id
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.cicd_profile.name
  vpc_security_group_ids = [aws_security_group.cicd_sg.id]
  user_data = "${file("templates/install_jenkins.sh")}"

  root_block_device {
    volume_size = "30"
  }
  key_name = aws_key_pair.cicd_key_pair.id
  tags = {
    Name = "${var.project}_instance"
  }
}

