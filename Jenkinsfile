pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        step {
          def app = docker.build "perfmgmt"
        }
      }
    }
  }
}
