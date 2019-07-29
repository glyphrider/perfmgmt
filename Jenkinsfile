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
  }
}
