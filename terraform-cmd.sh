#!/bin/bash
terraform init
terraform plan
cat s3-bucket.tf
ls -la
terraform apply -auto-approve
