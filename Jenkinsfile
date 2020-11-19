pipeline {
  agent any
  stages {
    stage('run pytests') {
      steps {
	sh 'cd frontend/
	sh 'pytest --cov application'
	sh 'cd .. && cd backend/'
	sh 'pytest --cov application'
}
}
  
  stage('build frontend images') {
      steps {
        sh 'cd frontend/'
        sh 'sudo docker build -t rjagajith/flask-app:1.0 /home/ubuntu/cne-sfia2-brief/frontend/'
      }
    }
    stage('build backend images') {
      steps {
        sh 'cd ..'
        sh 'cd backend/'
        sh 'sudo docker build -t rjagajith/flask-app:1.0 /home/ubuntu/cne-sfia2-brief/frontend/'
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
