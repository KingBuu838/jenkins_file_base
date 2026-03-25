resource "aws_s3_bucket" "class7-gcheck" {
  bucket_prefix = "class7-jenkins-gcheck-bucket"
  force_destroy = true

  
  

  tags = {
    Name = "GCheck Bucket"
    Environment = "Buckets"
  }
}