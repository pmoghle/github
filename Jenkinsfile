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
              sh "echo 'running the system check commands'"
              sh "whoami"
              sh "pwd"
              sh "aws s3 ls"
              sh "sed -i 's/testbucket001/$BUCKET_NAME/g' s3-bucket.tf"
              sh "cat s3-bucket.tf"
                }
            }
        }
        stage('terraform steps'){
          steps{
            script{
              sh "chmod a+x terraform-cmd.sh "
              sh " ./terraform-cmd.sh"
              
                }
            }
        }
    }
}
