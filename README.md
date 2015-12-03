### apache2 webserver with Let's Encrypt on Ubuntu

[Let's Encrypt](https://github.com/letsencrypt/letsencrypt) is a service generating HTTPS certificates for you and installing them in your apache2 webserver.

### Use with own Dockerfile  
Start with creating a Dockerfile  
`FROM whiledo/letsencrypt-apache-ubuntu`  
`... deploy your app, or do other stuff`  
`CMD ["apache2ctl", "-D", "FOREGROUND"]`  

build it with  
`docker build -t myname/myapp .`  
(Be sure to be in the directory of your Dockerfile)

run with  
`docker run -d --name myappcontainer -p 80:80 -p 443:443 myname/myapp`  

### Just run without new Dockerfile  
if you don't want to create a Dockerfile, you can just run  
`docker run -d --name myappcontainer -p 80:80 -p 443:443 whiledo/letsencrypt-apache-ubuntu`

### Install the https certificate  
It is important to expose port 80, because the Let's Encrypt Server will try to find yourwebsite.org:80  

Now log in to the running container  
`docker exec -it myappcontainer /bin/bash`  

And install the https certificate  
`/data/letsencrypt/letsencrypt-auto --apache --email your@email.org --agree-tos -d yourwebsite.org`  

exit with `exit`
