pipeline {
    agent any 
    stages {
        stage('Pull') { 
            steps {
                git 'https://github.com/clouddevopstrainer/Jenkins-Terra.git'
            }
        }
        stage('terraform init') {
            steps {
                sh 'sudo terraform init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'sudo terraform plan'
            }
        }
        stage('terraform validate') {
            steps {
                sh 'sudo terraform validate'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'sudo terraform ${Action} --auto-approve'
            }
        }
    }
}
