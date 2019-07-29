pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        script {
          def app = docker.build "perfmgmt"
        }
      }
    }
    stage('Push container image') {
      steps {
        script {
          docker.withRegistry('446235720820.dkr.ecr.us-east-1.amazonaws.com/vht-eks-devtest', 'ecr:us-east-1:vhtxdev') {
            app.push('latest')
          }
        }
      }
    }
  }
}
