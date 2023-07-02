#!/bin/bash

COMPONENT=frontend
LOGFILE="/tmp/${COMPONENT}.log"

ID=$(id -u)

if [ $ID -ne 0 ] ; then
    echo -e "\e[31m This script is expected to be run by a root user or with a sudo privilege \e[0m"
    exit 1
fi

stat() {
    if [ $? -eq 0 ] ; then
        echo -e "\e[32m success \e[0m"
    else
        echo -e "\e[31m failure \e[0m"
        exit 2
    fi
}

echo "Installing Nginx :"
yum install nginx -y  &>> $LOGFILE
stat $?

echo -n "Downloading the frontend component  :"
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "Performing Cleanup:"
cd /usr/share/nginx/html
rm -rf *  &>> $LOGFILE
stat $?

echo -n "Extracting ${COMPOMENT} component :"
unzip /tmp/${COMPONENT}.zip  &>> $LOGFILE
mv $COMPONENT-main/*  .
mv static/* .
rm -rf ${COMPONENT}-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf
stat $?

#The frontend is the service in RobotShop to serve the web content over Nginx.

#Install Nginx.

```
# yum install nginx -y
# systemctl enable nginx
# systemctl start nginx

```

# Let's download the HTDOCS content and deploy it under the Nginx path.

```
# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

```

# Deploy in Nginx Default Location.