pipeline {
    agent any
    stages{
        stage('Parameters setup'){
          steps{
            script{
              properties([parameters([string(description: 'Please eneter S3 bucket name', name: 'S3_BUCKET_NAME')])])
                }
            }
        }
        stage('Environmental variables setup'){
          steps{
            script{
              env.BUCKET_NAME=params.S3_BUCKET_NAME
              sh "sed -i 's/testbucket001/$BUCKET_NAME/g' s3-bucket.tf"
              sh "cat s3-bucket.tf"
                }
            }
        }
        stage('terraform init'){
          steps{
            script{
              sh " terraform init"
              sh "
                }
            }
        }
        stage('Terraform plan'){
          steps{
            script{
              sh " terraform init"
                }
            }
        }
        stage('Terraform apply'){
          steps{
            script{
              sh " terraform apply -auto-approve"
                }
            }
        }
    }
}
