#!/bin/bash

#script should be 'sudo chmod 700 install.sh' before attempting to run

echo "Starting..."

sudo apt-get --assume-yes update

echo "Installing curl..."

sudo apt install curl

echo "Done with curl."

echo "Installing vim..."

sudo apt --assume-yes install vim

echo "Done with vim."

echo "Installing ifconfig..."

sudo apt install net-tools

echo "done with ifconfig."

echo "Installing Docker..."
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "Done with Docker"

echo "Installing Docker Compose..."

sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Done with Docker Compose."

echo "Formatting docker output..."

mkdir ~/.docker && echo " {"psFormat":"table {{.ID}}\\t{{.Image}}\\t{{.Status}}\\t{{.Names}}"}
" >> ~/.docker/config.json

echo "Done formatting output."

echo "Installing node.js 10..."

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Done with node."

echo "Installing npm packages..."

sudo npm install -g prettier create-react-app

echo "Done with npm packages."

echo "Installing snap..."

sudo apt install snap

echo "Done with snap"

echo "Installing git and aliases..."

sudo apt --assume-yes install git

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

echo "Done installing git."

echo "installing tree..."
sudo apt install tree
echo "done with tree."

echo "installing Terminator..."
sudo apt install terminator
echo "done with Terminator."

echo "Formatting command prompt..."

 #"Manually set this in ~/.bashrc file: PS1='\w > ':
#dockgrp () { docker logs "$1" 2>&1  | grep -w "$2";}" >> ~/.bash_aliases

echo "done formatting command prompt."

echo "Adding bash aliases..."

echo "alias dockdown='docker-compose down'" >> ~/.bash_aliases
echo "alias dockup='docker-compose up'" >> ~/.bash_aliases
echo "alias dockcprune='docker container prune -f'" >> ~/.bash_aliases
echo "alias dockiprune='docker image prune -f'" >> ~/.bash_aliases
echo "alias docknprune='docker network prune -f'" >> ~/.bash_aliases
echo "alias explorer='xdg-open'" >> ~/.bash_aliases
echo "alias dockupdev='docker-compose -f docker-compose.dev.yml down && docker-compose -f docker-compose.dev.yml up'" >> ~/.bash_aliases
echo "alias treenode='tree -I \'\node_modules\'\'" >> ~/.bash_aliases
echo "alias dockprune='dockcprune && dockiprune && docknprune && docker ps -a'" >> ~/.bash_aliases

echo ". ~/.bashrc"
echo "alias"
echo "done with aliases"

echo "Setting .vimrc settings..."
echo "set number" >> ~/.vimrc
echo "Done with .vimrc settings."

echo "Install zsh and prereqs"
sudo apt install -y zsh
sudo apt-get install -y powerline fonts-powerline
echo "done installing zsh"

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "done with oh my"

# echo "Installing webstorm..."
# sudo snap install webstorm --classic
# echo "Done with webstorm."

echo "Installing VS Code..."
sudo snap install code --classic
echo "Done with VS code."

echo "A reboot is suggested."
