pipeline {
  agent any
  stages {
    stage('ssh in to the test-vm') {
      steps {
        sh 'chmod +x TestVM.sh'
        sh './TestVM.sh'
      }
    }
    stage('set ENV variables') {
      steps{
        sh 'cd /home/ubuntu/'
        sh 'export DATABASE_URI=mysql+pymysql://admin:radiatorspoon102@testdb.cvuavhfwkpq2.eu-west-1.rds.amazonaws.com/users'
        sh 'export TEST_DATABASE_URI=mysql+pymysql://admin:radiatorspoon102@testdb.cvuavhfwkpq2.eu-west-1.rds.amazonaws.com/testdb'
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
        sh 'sudo docker build -t rjagajith/flask-app:1.0 /home/ubuntu/cne-sfia2-brief/backend/'
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
