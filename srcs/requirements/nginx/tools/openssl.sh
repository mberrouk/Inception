openssl req -nodes -x509 \
	-newkey rsa:2048 -keyout /etc/nginx/ssl/ssl_certificate.key \
	-subj "/C=MO/CN=mberrouk.42.fr/L=benguerir/O=1337/OU=1337/emailAddress=mberrouk@student.1337.ma"\
       	-out /etc/nginx/ssl/ssl_certificate.pem
