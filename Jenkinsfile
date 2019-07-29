pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        script {
          def app = docker.build "vht-eks-devtest"
          docker.withRegistry('https://446235720820.dkr.ecr.us-east-1.amazonaws.com/vht-eks-devtest', 'ecr:us-east-1:vhtxdev') {
            app.push "vht-eks-devtest"
          }
        }
      }
    }
  }
}
