docker run -d \
--name jenkins \
-p 8080:8080 \
-p 50000:50000 \
--env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" \
--restart unless-stopped  \
-v /mnt/media/jenkins/data:/var/jenkins_home \
jenkins/jenkins