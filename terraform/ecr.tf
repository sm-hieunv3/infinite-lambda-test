resource "aws_ecr_repository" "ecr_repo" {
  name                 = "${var.project}-app"
  image_tag_mutability = "MUTABLE"
}