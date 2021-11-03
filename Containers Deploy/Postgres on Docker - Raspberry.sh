
# Postgres - Working
 docker run -d \
    --name postgres \
   -p 5432:5432  \
   -p 5050:5050  \
    -e POSTGRES_PASSWORD=postgres \
    -e PGDATA=/mnt/media/postgres/data/pgdata \
    -e DEFAULT_SERVER = '0.0.0.0'
    -e DEFAULT_SERVER_PORT = 5050

    -v /custom/mount:/mnt/media/postgres/data \
    postgres


# Postgres - To Login:
# docker exec -it postgres bash
# psql -U postgres

# Postgres - pgadmin / Not Working
# docker pull dpage/pgadmin4
#docker run -p 5050:80 \
#    -e "PGADMIN_DEFAULT_EMAIL=deleonquintero@gmail.com" \
#    -e "PGADMIN_DEFAULT_PASSWORD=postgres" \
#    -d dpage/pgadmin4

