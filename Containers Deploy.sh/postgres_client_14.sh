sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main" > \
/etc/apt/sources.list.d/postgresql.list'

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt update -y

 sudo apt install postgresql-client-14
 
 # TO backup one database from remote host:
 # pg_dump movie_data > movie_data.sql -h 192.168.1.200 -U postgres

 # To backup ALL databases from remote host:
 # pg_dumpall movie_data > movie_data.sql -h 192.168.1.200 -U postgres


 # TO Restore one database from remote host:
 # pg_dump movie_data < movie_data.sql -h 192.168.1.200 -U postgres

# To restore ALL databases from remote host:
 # pg_dumpall -f movie_data < movie_data.sql -h 192.168.1.200 -U postgres




