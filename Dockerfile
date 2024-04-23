FROM --platform=arm64 public.ecr.aws/docker/library/httpd:latest

COPY ./html/ /usr/local/apache2/htdocs/
