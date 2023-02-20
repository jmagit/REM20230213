FROM mariadb:latest
RUN apt-get update && \
    apt-get install -y curl && \
    cd /docker-entrypoint-initdb.d/ && \
    curl -L http://downloads.mysql.com/docs/sakila-db.tar.gz | tar -xz && \
    mv sakila-db/sakila-schema.sql ./01-sakila-schema.sql && \
    mv sakila-db/sakila-data.sql ./02-sakila-data.sql && \
    rm -rf sakila-db && \
    apt-get clean && apt-get autoclean
ENV MYSQL_ROOT_PASSWORD root
EXPOSE 3306

# docker build --file MariaDB.Dockerfile -t jamarton/mariadb-sakila .
# docker run -d -p 3306:3306 --name mariadb-sakila jamarton/mariadb-sakila
