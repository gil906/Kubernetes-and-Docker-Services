

# Create Volume PGDATA
# docker volume create --name=pgdata

docker volume create --driver local \
    --opt type=btrfs \
    --opt device=:/mnt/media/postgres/data/pgdata \
    PGDATA


# Postgres - Working
docker run -d \
--name postgres \
-p 5432:5432  \
--restart unless-stopped \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=postgres \
-e PGDATA=/mnt/media/postgres/data \
-v /mnt/media/postgres/data/:/var/lib/postgresql/data \
postgres:latest


<< postgres14 
docker run -d \
--name postgres \
-p 5432:5432  \
--restart unless-stopped \
--user postgres \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=postgres \
-v pgdata:/mnt/media/postgres/data/
-v /mnt/media/postgres/data/pgdata:/var/lib/postgresql/data \
postgres:latest

docker run -d \
--name postgres \
-p 5432:5432  \
--restart unless-stopped \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=postgres \
-e PGDATA=/mnt/media/postgres/data \
-v /mnt/media/postgres/data:/var/lib/postgresql/data \
postgres:latest


postgres14



<< pgadmin
# Postgres - To Login:
# docker exec -it postgres bash
# psql -U postgres

# Postgres - pgadmin / Not Working
# docker pull dpage/pgadmin4
#docker run -p 5050:80 \
#    -e "PGADMIN_DEFAULT_EMAIL=deleonquintero@gmail.com" \
#    -e "PGADMIN_DEFAULT_PASSWORD=postgres" \
#    -d dpage/pgadmin4
pgadmin








