resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name

  tags = {
    Name = "website-bucket"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.website.bucket
}
