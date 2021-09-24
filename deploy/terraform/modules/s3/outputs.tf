output "user" {
  value = aws_iam_user.default.arn
}

output "bucket" {
  value = aws_s3_bucket.links-backups.arn
}