FROM postgres:latest

COPY init.sh /docker-entrypoint-initdb.d/init.sh

RUN chmod +x /docker-entrypoint-initdb.d/init.sh


# docker tag postgres-app eduarandres/postgres-app:latest
# docker push eduarandres/postgres-app:latest