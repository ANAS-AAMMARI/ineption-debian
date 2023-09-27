FROM debian:bullseye

RUN apt update; \
    apt upgrade && apt install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/file.sql /

RUN service mariadb start && mysql < file.sql && rm -fr file.sql

EXPOSE 3306

CMD /usr/bin/mysqld_safe