# Using the data for current user
data "aws_canonical_user_id" "current_user" {}

# s3 private bucket
resource "aws_s3_bucket" "private_s3_bucket" {
    bucket = "testbucket001" 
    acl = "private"   
    
    grant {
      id          = data.aws_canonical_user_id.current_user.id
      type        = "CanonicalUser"
      permissions = ["FULL_CONTROL"]
  }
}
