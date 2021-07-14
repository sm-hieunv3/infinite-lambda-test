output "cicd_public_ip" {
  value = aws_instance.cicd.public_ip
}

output "bucket_url" {
  value = aws_s3_bucket.web.website_endpoint
}

output "db_endpoint" {
  value = aws_db_instance.postgresql.endpoint
}