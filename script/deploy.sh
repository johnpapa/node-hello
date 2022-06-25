#!/bin/sh
ssh ubuntu@54.215.214.117 <<EOF
 cd ~/node-hello
 git pull
 npm install — production
 pm2 restart all
 exit
EOF

