sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main" > \
/etc/apt/sources.list.d/postgresql.list'

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt update -y

 sudo apt install postgresql-client-14
 
 # Backup from client
 # pg_dump movie_data > movie_data.sql -h 192.168.1.200 -U postgres

