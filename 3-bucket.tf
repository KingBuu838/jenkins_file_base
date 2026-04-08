terraform {
backend "s3" {
    bucket  = "tf-gcheck-tuesday"             #terraform uses s3 backend first, backend bucket needs to already exist     
    key     = "jenkins/gcheck/tuesday/terraform.tfstate" 
    region  = "us-east-1"                          
    encrypt = true                                 
        } 
    }

resource "aws_s3_object" "pipeline-succes" {
  bucket       = aws_s3_bucket.class7-gcheck.bucket
  key          = "pipeline_success.png"
  source       = "./proof/pipeline_success.png"
  content_type = "image/png"

  etag = filemd5("./proof/pipeline_success.png")
}

resource "aws_s3_object" "webhook" {
  bucket       = aws_s3_bucket.class7-gcheck.bucket
  key          = "webhook.png"
  source       = "./proof/webhook.png"
  content_type = "image/png"

  etag = filemd5("./proof/webhook.png")
}

resource "aws_s3_object" "s3_bucket_image" {
  bucket       = aws_s3_bucket.class7-gcheck.bucket
  key          = "s3_bucket_image.png"
  source       = "./proof/s3_bucket_image.png"
  content_type = "image/png"

  etag = filemd5("./proof/s3_bucket_image.png")
}

resource "aws_s3_object" "armageddon_links" {
  bucket       = aws_s3_bucket.class7-gcheck.bucket
  key          = "armageddon_links.md"
  source       = "./proof/armageddon_links.md"
  content_type = "text/markdown"

  etag = filemd5("./proof/armageddon_links.md")
}

resource "aws_s3_bucket_public_access_block" "class7-gcheck" {
  bucket = aws_s3_bucket.class7-gcheck.id

  block_public_acls  = false
  ignore_public_acls = false
  block_public_policy = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "gcheck" {
  bucket = aws_s3_bucket.class7-gcheck.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicAccess"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.class7-gcheck.arn}/*"
      }
    ]
  })
}
