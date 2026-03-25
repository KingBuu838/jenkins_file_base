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

resource "aws_s3_object" "s3_bucket_images" {
  bucket       = aws_s3_bucket.class7-gcheck.bucket
  key          = "s3_bucket_images.png"
  source       = "./proof/s3_bucket_images.png"
  content_type = "image/png"

  etag = filemd5("./proof/s3_bucket_images.png")
}