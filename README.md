# Docker Example of Website hosting

## Prerequisites

Docker (or similar application)
AWS Account & Credentials
ECR Repo
AWS CLI

## Create your ECR repo

If you've not already, create an ECR repo to store your image.
```
aws ecr create-repository \
    --repository-name docker-example \
    --region ap-southeast-2
```

## Dockerfile

```
FROM ubuntu:22.04

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y apache2

EXPOSE 80

CMD [“apache2ctl”, “-D”, “FOREGROUND”]
```

## Build the Docker Image

1. Build the image using the docker command line
`docker build -t docker-example .`
2. Test the image
`docker run -p 80:8080 docker-example`

3. Ensure you are authenticated in AWS.
4. Authenticate your Docker client
`aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 168420111683.dkr.ecr.ap-southeast-2.amazonaws.com`
5. Tag your image
`docker tag <source_image_tag> <target_ecr_repo_uri>`

## Resources

https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html
