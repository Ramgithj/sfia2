# QAC SFIA2 Project

This application is a simple Flask application, ready to be deployed, for your SFIA2 project.

The following information should be everything you need to complete the project.

## Brief

The application must:

- Be deployed to a VM for testing
- Be deployed to production in a Kubernetes Cluster
- Make use of a Managed Database for both testing and production

## Application

The application is a Flask application running in 2 micro-services (front-end and back-end).  

The database directory is available should you: 
  - want to use a MySQL container for your database at any point, *or*
  - want to make use of the `Create.sql` file to pre-populate your database.

The application works by:
1. The front-end service making a GET request to the back-end service. 
2. The back-end service using a database connection to query the database and return a result.
3. The front-end service serving up a simple HTML to display the result.

### Database Connection

The Database connection is handled in the `./backend/application/__init__.py` file.

A typical Database URI follows the form:

```
mysql+pymysql://[db-user]:[db-password]@[db-host]/[db-name]
```

### Environment Variables

The application makes use of 2 environment variables:

- `DATABASE_URI`: as described above
- `SECRET_KEY`: any random String will work here

![app-diagram](https://i.imgur.com/wnbDazy.png)

## Testing
Include information on how to run Unit Tests here
Show where the integration test files live

Brief explanation about what they do(?)

## Infrastructure

The Minimum Viable Product for this project, should adhere to the following infrastructure diagram:

![mvp-diagram]

Stretch goals for this project include:

- Include the Kubernetes Cluster for production in your Terraform
- Use Ansible to configure the Test VM's environment
- Run Integration Tests, as well as Unit Tests

Completing the stretch goals should yield an infrastructure diagram similar to the following:

![stretch-digram]

**Good luck!**
