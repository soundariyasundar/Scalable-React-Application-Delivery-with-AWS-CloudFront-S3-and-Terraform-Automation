resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = var.s3_bucket
    origin_id  = "s3-origin"
  }
  
  enabled = true

  default_cache_behavior {
    target_origin_id = "s3-origin"

    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]

    viewer_protocol_policy = "allow-all"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }
  
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  
  viewer_certificate {
    acm_certificate_arn = var.acm_arn
    ssl_support_method = "sni-only"
  }
}
