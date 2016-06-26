#!/bin/bash
set -e


# install supervisord
yum install -y supervisor


# setup supervisor configs
cat > /etc/supervisord.d/alfresco.ini <<EOF
[program:alfresco]
priority=20
directory=/appli/alfresco/application/logs
command=/appli/tomcat/bin/startup.sh
user=tomcat
autostart=true
autorestart=false
stdout_logfile=/appli/alfresco/application/logs/catalina_stdout.log
stderr_logfile=/appli/alfresco/application/logs/catalina_stderr.log
EOF

