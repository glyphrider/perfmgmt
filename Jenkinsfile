def app
pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        script {
          app = docker.build "perfmgmt"
        }
      }
    }
    stage('Docker Test') {
      steps {
        script {
          echo "If we had tests, we would run them here."
        }
      }
    }
    stage('Docker Publish') {
      steps {
        script {
          docker.withRegistry('https://446235720820.dkr.ecr.us-east-1.amazonaws.com/vht-eks-devtest', 'ecr:us-east-1:vhtxdev') {
            app.push "${env.BUILD_NUMBER}"
            app.push "lastest"
          }
        }
      }
    }
  }
}
