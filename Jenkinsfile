pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        script {
          def app = docker.build "perfmgmt"
          docker.withRegistry('https://446235720820.dkr.ecr.us-east-1.amazonaws.com/vht-eks-devtest', 'ecr:us-east-1:vhtxdev') {
            app.push "${env.BUILD_NUMBER}"
            app.push "lastest"
          }
        }
      }
    }
  }
}
