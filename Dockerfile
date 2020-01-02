FROM php:7.4-cli
RUN mkdir /usr/src/myapp
COPY send.php /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "php", "./send.php" ]
