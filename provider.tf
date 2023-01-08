
#terraform block and version set
terraform {
  required_version = "~>1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.47.0"
    }
  }
}

#provider for AWS
provider "aws" {
    profile="default"
    region="ap-south-1" 
}
