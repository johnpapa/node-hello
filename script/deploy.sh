ssh ec2-user@54.202.241.94 <<EOF
cd /home/gkbdevops/GJ/GJ_API
git pull
npm install
pm2 restart all
pm2 status
