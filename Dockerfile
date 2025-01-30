FROM alpine:3.20
LABEL maintainer="xaryna@gmail.com"
LABEL description="Alpine based image with apache2 and php8.4"

# Setup apache and php
RUN apk --no-cache --update \
    add apache2 apache2-ssl apache2-brotli \
        curl \
        php84-apache2 php84-bcmath php84-bz2 php84-calendar php84-common php84-ctype php84-curl php84-dom php84-fileinfo php84-gd php84-gmp php84-iconv php84-mbstring php84-mysqli php84-mysqlnd php84-openssl php84-pdo php84-pdo_odbc php84-pdo_mysql php84-pdo_pgsql php84-pdo_sqlite php84-phar php84-session php84-sqlite3 php84-xml php84-tidy php84-zip php84-simplexml \    
    && mkdir /htdocs \
    && mkdir /var/www/pbase

EXPOSE 80 443

ADD docker-entrypoint.sh /

HEALTHCHECK CMD wget -q --no-cache --spider localhost

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
