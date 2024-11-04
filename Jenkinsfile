pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker-compose build'
        sh 'hugo'
      }
    }
    stage('Run') {
      steps {
        sh 'docker-compose down'
        sh 'docker-compose up -d'
      }
    }
  }
}
