Build the image
`sudo docker build -t xaryna/apache-php-docker .`

Docker Compose
```
    services:
      web:
        image: xaryna/apache-php-docker
        restart: always
        ports:
          - "1880:80"
          #- "1443:443"
        volumes:
          - /home/debian/docker/data/www/app_01:/htdocs
```
