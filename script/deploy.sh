ssh deploy@54.70.180.53 -i deployy.pem 
cd /home/ec2-user/node-hello
git pull
npm install
pm2 restart all
pm2 status
