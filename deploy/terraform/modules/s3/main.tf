resource "aws_s3_bucket" "links-backups" {
  bucket = "links-backups"
  acl    = "private"

  tags = {
    Name        = "links-backups-bucket"
  }
}

resource "aws_iam_user" "default" {
  name = "links-backups-rw"
}

resource "aws_s3_bucket_policy" "full_access" {
  bucket = aws_s3_bucket.links-backups.id

  policy = <<POLICY
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Sid": "FullAccess",
         "Effect": "Allow",
         "Principal": {
            "AWS": ["${aws_iam_user.default.arn}"]
         },
         "Action": ["s3:*"],
         "Resource": [
            "${aws_s3_bucket.links-backups.arn}",
            "${aws_s3_bucket.links-backups.arn}/*"
         ]
      }
  ]
}
POLICY
}
