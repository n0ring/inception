FROM debian:buster

COPY . .
RUN chmod +x install.sh && sh install.sh

ENTRYPOINT vsftpd 
