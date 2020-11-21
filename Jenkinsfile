pipeline {
  agent any
  stages {
    stage('ssh in to the test-vm') {
      steps {
        sh 'ssh -i /var/lib/jenkins/id_rsa ubuntu@34.244.54.1'    
      }
    }
    stage('set ENV variables') {
      steps{
        sh 'export DATABASE_URI=mysql+pymysql://admin:radiatorspoon102!@testdb.cvuavhfwkpq2.eu-west-1.rds.amazonaws.com/users'
        sh 'export TEST_DATABASE_URI=mysql+pymysql://admin:radiatorspoon102!@testdb.cvuavhfwkpq2.eu-west-1.rds.amazonaws.com/testdb'
      }
    }
    stage('change working directory') {
      steps {
          dir('/home/ubuntu/') {
            sh "pwd"
          }
        } 
      }
    stage('clone repo') {
      steps{
        sh 'sudo rm -r sfia2'
        sh 'git clone https://github.com/Ramgithj/sfia2.git'
        sh 'cd sfia2/'
      }
    }
    stage('docker-compose up and exec') {
      steps{
        sh 'docker-compose up -d --build'
        sh 'docker exec backend bash -c "pytest tests/ --cov application" > backend-report.txt'
        sh 'docker exec frontend bash -c "pytest tests/ --cov application" > frontend-report.txt'
      }
    }
    stage('stop the application and exit in to jenkins VM') {
      steps{
        sh 'docker compose down'
        sh 'exit'
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
