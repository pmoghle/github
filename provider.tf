
#terraform block and version set
terraform {
  required_version = "~>1.3.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.47.0"
    }
  }
}

#provider for AWS
provider "aws" {
    shared_credentials_files = ["~/.aws/credentials"]
    region="ap-south-1" 
    profile="default"
}
