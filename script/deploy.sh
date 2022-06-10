ssh -i /home/ubuntu/node.js.pem ubuntu@54.215.214.117 <<EOF
sudo su
sudo git pull
git pull
npm install  - production
npm install  
pm2 restart all

