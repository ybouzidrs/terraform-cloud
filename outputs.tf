output "bucket_arn" {
  value = module.s3_bucket.arn
}

output "web_app_public_ip" {
  value = aws_instance.web_app.public_ip
}