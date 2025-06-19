module "s3" {
  source      = "./modules/s3"
  bucket_name = "s3cdnbucket-sound-12345"
}

module "cloudfront" {
  source               = "./modules/cloudfront"
  acm_arn              = "arn:aws:acm:us-east-1:804363747200:certificate/4a849493-b835-4090-afb9-a493a784beda"  # ACM must be in us-east-1
  s3_bucket = module.s3.bucket_regional_domain_name
}
