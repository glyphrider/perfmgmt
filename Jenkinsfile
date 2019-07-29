pipeline {
  agent {
  }
  stages {
    stage('Docker Build') {
      steps {
        def app = docker.build "perfmgmt"
      }
    }
  }
}
