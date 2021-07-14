resource "aws_iam_instance_profile" "cicd_profile" {
  name = "${var.project}_profile"
  role = aws_iam_role.cicd_role.name
}
resource "aws_iam_role" "cicd_role" {
  name = "${var.project}_cicd_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}
resource "aws_iam_policy" "cicd-policy" {
  name        = "${var.project}_policy"
  description = "A test policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "s3:*"
        Resource = [
           aws_s3_bucket.web.arn,
          "${aws_s3_bucket.web.arn}/*",
        ]
      },
    ]
  })
}
resource "aws_iam_role_policy_attachment" "cicd-attach_policy" {
  role       = "${aws_iam_role.cicd_role.name}"
  policy_arn = "${aws_iam_policy.cicd-policy.arn}"
}