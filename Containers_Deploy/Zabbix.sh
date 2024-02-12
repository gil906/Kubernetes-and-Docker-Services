$Zabbix  Server 5.2 with Postgress in Containers  -----------------------------------------------------------------------------
 docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 zabbix-net


docker run --name postgres-server -t \
      -e POSTGRES_USER="zabbix" \
      -e POSTGRES_PASSWORD="XXXXXX" \
      -e POSTGRES_DB="zabbix" \
      --network=zabbix-net \
      --restart unless-stopped \
      -d postgres:latest


 docker run --name zabbix-snmptraps -t \
      -v /zbx_instance/snmptraps:/var/lib/zabbix/snmptraps:rw \
      -v /var/lib/zabbix/mibs:/usr/share/snmp/mibs:ro \
      --network=zabbix-net \
      -p 162:1162/udp \
      --restart unless-stopped \
      -d zabbix/zabbix-snmptraps:alpine-5.2-latest

docker run --name zabbix-server-pgsql -t \
      -e DB_SERVER_HOST="postgres-server" \
      -e POSTGRES_USER="zabbix" \
      -e POSTGRES_PASSWORD="zabbixG9d0e6451" \
      -e POSTGRES_DB="zabbix" \
      -e ZBX_ENABLE_SNMP_TRAPS="true" \
      --network=zabbix-net \
      -p 10051:10051 \
      --volumes-from zabbix-snmptraps \
      --restart unless-stopped \
      -d zabbix/zabbix-server-pgsql:alpine-5.2-latest


docker run --name zabbix-web-nginx-pgsql -t \
      -e ZBX_SERVER_HOST="zabbix-server-pgsql" \
      -e DB_SERVER_HOST="postgres-server" \
      -e POSTGRES_USER="zabbix" \
      -e POSTGRES_PASSWORD="zabbixG9d0e6451" \
      -e POSTGRES_DB="zabbix" \
      --network=zabbix-net \
      -p 8443:8443 \
      -p 8080:8080 \
      -v /etc/ssl/nginx:/etc/ssl/nginx:ro \
      --restart unless-stopped \
      -d zabbix/zabbix-web-nginx-pgsql:alpine-5.2-latest



$Zabbix Agent - On Server
docker run  \
      --name zabbix-agent  \
      -e ZBX_HOSTNAME="Zabbix server"  \
      -e ZBX_SERVER_HOST=172.17.0.1  \
	 -p 10050:10050 \
	 -d zabbix/zabbix-agent:alpine-latest
	

$Zabbix Agent - On external Agent
docker run  \
      --name zabbix-agent  \
      -e ZBX_HOSTNAME="serverslave"  \
      -e ZBX_SERVER_HOST=192.168.5.200,172.17.0.1  \
	 -p 10050:10050 \
      -d zabbix/zabbix-agent:alpine-latest
