/*Jenkinsfile (Declarative Pipeline)*/
/* Requires the Docker Pipeline plugin */
pipeline {
    agent any
    environment {
        FLASK_APP = 'flaskr'
        FLASK_ENV = 'development'
    }
    stages {
        stage('build') {
            steps {
                sh 'ls'
            }
        }
        stage ('Deploy') {
        steps {
            sh 'sudo apt-get update'
            sh 'sudo apt-get install openssh-client -y'
            sh 'scp deploy.sh ec2-user@ec2-54-199-250-191.ap-northeast-1.compute.amazonaws.com:~/'
            sh 'ssh ec2-user@ec2-54-199-250-191.ap-northeast-1.compute.amazonaws.com "chmod +x deploy.sh"'
            sh 'ssh ec2-user@ec2-54-199-250-191.ap-northeast-1.compute.amazonaws.com ./deploy.sh'
        }
    }
    }
}
