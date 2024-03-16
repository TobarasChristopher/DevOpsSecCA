sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


nvm install 18
nvm use 18

echo "Node version:"
node -v
echo "npm version:"
npm -v

sudo npm install -g pm2

pm2 stop DevOpsSecCA

cd DevOpsSecCA/

npm install

echo $PRIVATE_KEY > privatekey.pem
echo $SERVER > server.crt

pm2 start ./bin/www --name DevOpsSecCA
