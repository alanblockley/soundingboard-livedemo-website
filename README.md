# Docker Example of Website hosting

## Prerequisites

Docker (or similar application)
AWS Account & Credentials
ECR Repo
AWS CLI

## Create...

Security Groups
 - Internal Web
 - External Web
 - Load Balancer if not already made
 
## Create your ECR repo

If you've not already, create an ECR repo to store your image.
```
aws ecr create-repository \
    --repository-name docker-example \
    --region ap-southeast-2
```

## Dockerfile

Keep your Dockerfile simple. 

```
FROM public.ecr.aws/docker/library/httpd:latest

COPY ./html/ /usr/local/apache2/htdocs/
```

Other common options are :
 - ADD	Add local or remote files and directories.
 - CMD	Specify default commands.
 - ENTRYPOINT	Specify default executable.
 - ENV	Set environment variables.
 - EXPOSE	Describe which ports your application is listening on.
 - RUN	Execute build commands.
 - SHELL	Set the default shell of an image.
 - USER	Set user and group ID.
 - WORKDIR	Change working directory.


## Build the Docker Image

1. Build the image using the docker command line
`docker build -t rubberduck-website .`

2. Test the image
`docker run -p 80:8080 docker-example`

3. Ensure you are authenticated in AWS.

4. Authenticate your Docker client
`aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 168420111683.dkr.ecr.ap-southeast-2.amazonaws.com`

5. Tag your image
`docker tag rubberduck-website:latest 168420111683.dkr.ecr.ap-southeast-2.amazonaws.com/rubberduck-website:latest`

6. Push your image
`docker push 168420111683.dkr.ecr.ap-southeast-2.amazonaws.com/rubberduck-website:latest`

## Resources

https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html
