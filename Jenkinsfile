pipeline {
  agent any
  stages {
    stage('ssh in to the test-vm') {
      steps {
        sh 'chmod +x TestVM.sh'
        sh './TestVM.sh'
      }
    }
    stage('build frontend images') {
      steps {
        sh 'cd /home/ubuntu/sfia2/frontend/'
        sh 'sudo docker build -t rjagajith/flask-app:1.0 /home/ubuntu/sfia2/frontend/'
      }
    }
    stage('build backend images') {
      steps {
        sh 'cd ..'
        sh 'cd backend/'
        sh 'sudo docker build -t rjagajith/flask-app:1.0 /home/ubuntu/sfia2/backend/'
      }
    }
    stage('login and push to dockerhub') {
      steps {
        sh 'sudo docker login'
        sh 'sudo docker push rjagajith/flask-app:1.0'
      }
    }
  }
}
