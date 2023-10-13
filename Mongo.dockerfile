# Usa la imagen oficial de MongoDB como base
FROM mongo:latest

# Copia el script a la imagen
COPY init-script.js /docker-entrypoint-initdb.d/

# Establece el comando de inicio de MongoDB
CMD ["mongod"]

# docker tag mongo-app eduarandres/mongo-app:latest
# docker push eduarandres/mongo-app:latest