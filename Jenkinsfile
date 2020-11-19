
pipeline {
  agent any
  stages {
    stage('build frontend images') {
      steps {
        sh 'cd frontend/'
        sh 'sudo docker build -t rjagajith/flask-frontend:1.0 /home/ubuntu/cne-sfia2-brief/frontend/'
        
      }
    }
    stage('build backend images') {
      steps {
        sh 'cd ..'
        sh 'cd backend/'
        sh 'sudo docker build -t rjagajith/flask-app:1.0 /home/ubuntu/cne-sfia2-brief/backend/'
      }
    }
    stage('login and push to dockerhub') {
      steps {
        sh 'sudo docker login'
        sh 'sudo docker push rjagajith/flask-frontend:1.0'
        sh 'sudo docker push rjagajith/flask-app:1.0'
      }
    }
  }
}
