## What is it?

This is a docker container for the webapp.


## How to run?

Run the command as following:

    docker run -d -v <path/to/your/webapp>:/webapp -p 8080:8080 panguolin/mdwiki:latest

by default, the volume `/webapp` should contain your webapp projects source codes.


## How to use?

You can find it running on

    http://localhost:8080
