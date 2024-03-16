#Install and upgrade APT seperately without node and npm due to a previous issue

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl

#install nvm from Week 5 tutorial
#https://budi.day/2020/06/install-nodejs-aws-ec2-keep-running-pm2/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#use nvm version 18 because 10 breaks
nvm install 18
nvm use 18

#install pm2 globally
npm install -g pm2

#stop any previous instances
pm2 stop DevOpsSecCA

#enter dir
cd DevOpsSecCA/

#install npm without sudo (creates issues)
npm install

#echo HTTPS vars to program
echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

#start www process using pm2
pm2 start ./bin/www --name DevOpsSecCA
