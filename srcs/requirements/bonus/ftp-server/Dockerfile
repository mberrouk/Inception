FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt install vsftpd -y

COPY ./conf/vsftpd.conf /etc/
ARG FTP_USER FTP_PASS
COPY ./tools/user_conf.sh /user_conf.sh
RUN chmod +x user_conf.sh && /user_conf.sh

RUN service vsftpd start

CMD ["vsftpd"]
