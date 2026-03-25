
terraform {
backend "s3" {
    bucket  = "tf-backend-gcheck"                 
    key     = "jenkins-gcheck.tfstate" 
    region  = "us-east-1"                          
    encrypt = true                                 
  } 
}


resource "aws_s3_object" "pipeline-succes" {
  bucket       = aws_s3_bucket.class7-jenkins-gcheck-bucket.bucket
  key          = "pipeline_success.png"
  source       = "./proof/pipeline_success.png"
  content_type = "png"

  etag = filemd5("./proof/pipeline_success.png")
}

resource "aws_s3_object" "webhook" {
  bucket       = aws_s3_bucket.class7-jenkins-gcheck-bucket.bucket
  key          = "webhook.png"
  source       = "./proof/webhook.png"
  content_type = "png"

  etag = filemd5("./proof/webhook.png")
}

# resource "aws_s3_object" "" {
#   bucket       = aws_s3_bucket.website.bucket
#   key          = "trump_keisha.jpg"
#   source       = "./trump_keisha.jpg"
#   content_type = "image/jpg"

#   etag = filemd5("./trump_keisha.jpg")
# }