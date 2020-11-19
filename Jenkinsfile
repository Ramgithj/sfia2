pipeline {
  agent any
  stages {
    stage {'clone repo'} {
      steps{
        sh 'git clone https://github.com/Ramgithj/sfia2.git'
      }
    }
    stage('build frontend images') {
      steps {
        sh 'cd frontend/'
        sh 'sudo docker build -t rjagajith/flask-app:1.0 .'
      }
    }
    stage('build backend images') {
      steps {
        sh 'cd ..'
        sh 'cd backend/'
        sh 'sudo docker build -t rjagajith/flask-app:1.0 .'
      }
    }
    stage('login and push to dockerhub') {
      steps {
        sh 'sudo docker login'
        sh 'sudo docker push lukebenson1/flask-app:1.0'
      }
    }
  }
}
