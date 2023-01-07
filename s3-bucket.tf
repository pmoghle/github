# Using the data for current user
data "aws_canonical_user_id" "current_user" {}

# s3 private bucket
resource "aws_s3_bucket" "private_s3_bucket" {
    bucket = "testbucket001" 
   # acl = "private"   
    
   # grant {
    #  id          = data.aws_canonical_user_id.current_user.id
     # type        = "CanonicalUser"
      #permissions = ["FULL_CONTROL"]
  #}
}


resource "aws_s3_bucket_acl" "test-aws-s3-bucket-acl" {
  bucket = aws_s3_bucket.private_s3_bucket.id
  access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current_user.id
        type = "CanonicalUser"
      }
      permission = "FULL_CONTROL"
    }

    owner {
      id = data.aws_canonical_user_id.current_user.id
    }
  }
}
