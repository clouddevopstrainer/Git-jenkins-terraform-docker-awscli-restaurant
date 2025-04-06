pipeline {
    agent any 
    stages {
        stage('Pull') { 
            steps {
                git branch: 'master', url: 'https://github.com/clouddevopstrainer/Git-jenkins-terraform-docker-awscli-restaurant.git'
            }
        }

        stage('Setup AWS CLI') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'AWS',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) {
                    sh '''
                    aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
                    aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
                    aws configure set default.region us-east-1
                    '''
                }
            }
        }

        stage('terraform init') {
            steps {
                sh 'terraform init'  // Initialize Terraform configuration
            }
        }

        stage('terraform plan') {
            steps {
                sh 'terraform plan -out=plan.tfplan'  // Save the plan to a file
            }
        }

        stage('terraform validate') {
            steps {
                sh 'terraform validate'  // Validate the Terraform configuration
            }
        }

        stage('terraform apply') {
            steps {
                sh 'terraform apply --auto-approve plan.tfplan'  // Apply the saved plan file
            }
        }
    }
}
