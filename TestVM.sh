#!/bin/bash
ssh -i /var/lib/jenkins/id_rsa ubuntu@54.247.4.200 << EOF
if [ ! -d sfia2 ]
then
    git clone https://github.com/Ramgithj/sfia2.git
fi
cd sfia2/
export DATABASE_URI=mysql+pymysql://admin:radiatorspoon102@testdb.cvuavhfwkpq2.eu-west-1.rds.amazonaws.com/users
export TEST_DATABASE_URI=mysql+pymysql://admin:radiatorspoon102@testdb.cvuavhfwkpq2.eu-west-1.rds.amazonaws.com/testdb
docker-compose up -d
echo "completed"
docker exec backend bash -c "pytest tests/ --cov application" > backend-report.txt
docker exec frontend bash -c "pytest tests/ --cov application" > frontend-report.txt
docker-compose down
EOF
