# s3 private bucket
resource "aws_s3_bucket" "private_s3_bucket" {
    bucket = "testbucket001" 
    acl = "private"   
}
