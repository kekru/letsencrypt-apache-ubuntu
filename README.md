## apache2 webserver with Let's Encrypt on Ubuntu

[Let's Encrypt](https://github.com/letsencrypt/letsencrypt) is a service generating HTTPS certificates for you and installing them in your apache2 webserver.

Start with creating a Dockerfile  
```FROM whiledo/letsencrypt-apache-ubuntu  
RUN /data/letsencrypt/letsencrypt-auto --apache --email your@email.org --agree-tos -d yourwebsite.org  
CMD ["apache2ctl", "-D", "FOREGROUND"]```  

build it with  
`docker build -t myname/myapp .`  
(Be sure to be in the directory of your Dockerfile)

run with  
`docker run -d --name myappcontainer -p 443:443 myname/myapp`  