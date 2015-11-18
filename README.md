# alpine-laravel-base
Alpine Linux Docker image (~56.63 MB) running Laravel Framework.  Image suitable for running in Tutum/Kubernetes style hosted distributed environments. 

Image is based on [sillelien/base-alpine](https://hub.docker.com/r/sillelien/base-alpine/) base image which incorporates S6 for process management.

## To build

    $ make build

    or

    $ docker build -t yourname/alpine-laravel-base .

## To run
Map your application to /var/www directory

    $ docker run -d -p 8000:80 -v laravel-app:/var/www yourname/alpine-laravel-base

## Use with Docker Compose
A docker-compose.yml with this image would look like:

    web:
      image: michaeldim/alpine-laravel-base
      volumes:
        - laravel-app:/var/www
      ports:
        - "80:80"
      links:
        - "mysql:mysql"
    mysql:  
      image: tutum/mysql:5.6
      ports:
        - "3306:3306"
      environment:
        MYSQL_PASS: password
