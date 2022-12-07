FROM debian

RUN apt-get update && apt-get install -y apache2 && apt-get clean

COPY ./app/index.php /var/www/html/ 

RUN rm -rf /var/www/html/index.html

VOLUME /var/www/html/

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl"]

CMD ["-D", "FOREGROUND"]