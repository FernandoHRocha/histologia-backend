FROM wyveo/nginx-php-fpm:php81
EXPOSE 80
COPY ./config/default.conf etc/nginx/conf.d/
#WORKDIR /usr/share/nginx
# RUN rm -rf /usr/share/nginx/html
RUN ln -s /usr/share/nginx/public /usr/share/nginx/html