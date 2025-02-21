pipeline {
  agent any
  environment {
    WEBHOOK_SECRET = credentials('webhook-secret')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker-compose build'
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
