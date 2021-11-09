

#Jenkins - Server
# To Enable logs
mkdir data
cat > data/log.properties <<EOF
handlers=java.util.logging.ConsoleHandler
jenkins.level=FINEST
java.util.logging.ConsoleHandler.level=FINEST
EOF

docker run -d \
--name jenkins \
-p 8081:8080 \
-p 50000:50000 \
--env JAVA_OPTS="-Djava.util.logging.config.file=/var/jenkins_home/log.properties" \
--restart unless-stopped  \
-v /mnt/media/jenkins/data:/var/jenkins_home \
jenkins/jenkins

User: gil906
Password: 3?=WB!5>qWcv'H3y

Jenkins - Agent

docker run -d -i --rm --name jenkins-agent --init jenkins/agent java -jar /usr/share/jenkins/agent.jar

docker run -d \
-i --rm \
--name jenkins-agent \
--init \
jenkins/agent \
java -jar agent.jar \
-jnlpUrl http://192.168.1.200:8081/computer/Raspberry/jenkins-agent.jnlp \
-secret @secret-file -workDir "/mnt/media/jenkins" 

docker run -d --rm --name=agent1 -p 22:22 \
-e "JENKINS_AGENT_SSH_PUBKEY=[your-public-key]" \
jenkins/ssh-agent:alpine



docker run -d --rm --name=agent1 -p 22:22 \
-e "JENKINS_AGENT_SSH_PUBKEY=[your-public-key]" \
jenkins/ssh-agent
