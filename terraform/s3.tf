data "template_file" "bucket_policy" {
#  depends_on = [aws_s3_bucket.web]
  template = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.web.arn,
          "${aws_s3_bucket.web.arn}/*",
        ]
      },
    ]
  })
}
resource "aws_s3_bucket" "web" {
  bucket = var.web_domain
  acl    = "public-read"
#  policy = data.template_file.bucket_policy.rendered

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}
resource "aws_s3_bucket_policy" "web_policy" {
  bucket = "${aws_s3_bucket.web.id}"
  policy = data.template_file.bucket_policy.rendered
}
