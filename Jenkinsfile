/*Jenkinsfile (Declarative Pipeline)*/
/* Requires the Docker Pipeline plugin */
pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t yotamnitzanim/nitzanim-ex-01 .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push lyotamnitzanim/nitzanim-ex-01'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
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
