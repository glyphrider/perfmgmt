pipeline {
  agent any
  stages {
    stage('Docker Build') {
      steps {
        def app = docker.build "perfmgmt"
      }
    }
  }
}
