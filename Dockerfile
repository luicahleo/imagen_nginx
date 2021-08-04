##Descargamos una versión concreta de UBUNTU, a través del tag
FROM ubuntu
MAINTAINER TTRAJANO Formacion "luisrolandocahuanaleon@gmail.com"
##Actualizamos el sistema
RUN apt-get update && apt-get install nano
##Instalamos nginx
RUN apt-get install -y nginx
##Creamos un fichero index.html en el directorio por defecto de nginx
##RUN echo 'Mi primer Dockerfile' > /usr/share/nginx/html/index.html
VOLUME /var/www/html
ADD exjemplo_web/ /var/www/html
##Arrancamos NGINX a través de ENTRYPOINT para que no pueda ser ##modificar en la creación del contenedor
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
##Exponemos el Puerto 80
EXPOSE 80