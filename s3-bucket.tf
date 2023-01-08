# Using the data for current user
data "aws_canonical_user_id" "current_user" {}

# s3 private bucket
resource "aws_s3_bucket" "private_s3_bucket" {
    bucket = "testbucket001" 
    #acl = "private"   
    
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
resource "aws_s3_bucket_object" "object" {
  bucket = "testbucket001"
  key    = "abc.txt"
  source = "abc.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("abc.txt")
  depends_on=[
	  aws_s3_bucket.private_s3_bucket
  ]
}

#Resource to add bucket policy to a bucket 
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.private_s3_bucket.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
	      "AWS":"arn:aws:iam::943781783687:user/s3bucket"
      },
      "Action": [ 
	      "s3:GetObject",
	      "s3:GetBucketLocation",
	      "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.private_s3_bucket.arn}",
        "${aws_s3_bucket.private_s3_bucket.arn}/*"
      ]
    }
  ]
}
EOF
}
