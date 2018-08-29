#!/bin/bash

#script should be 'sudo chmod 700 install.sh' before attempting to run

echo "Starting..."

sudo apt-get --asume-yes update

echo "Installing curl..."

sudo apt install curl

echo "Done with curl."

echo "Installing vim..."

sudo apt --asume-yes install vim

echo "Done with vim."

echo "Installing ifconfig..."

sudo apt install net-tools

echo "done with ifconfig."

echo "Installing Docker..."
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "Done with Docker"

echo "Installing Docker Compose..."

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Done with Docker Compose."

echo "Installing node.js 10..."

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Done with node."

echo "Installing yarn..."

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

echo "Done with yarn."

echo "Installing snap..."

sudo apt install snap

echo "Done with snap"

echo "Installing git and aliases..."

sudo apt --asume-yes install git

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
echo "alias testchrome='docker-compose -f docker-compose.chrome.yml up --build --abort-on-container-exit'" >> ~/.bash_aliases
echo "alias testfirefox='docker-compose -f docker-compose.firefox.yml up --build --abort-on-container-exit'" >> ~/.bash_aliases
echo "alias treenode='tree -I \'\node_modules\'\'" >> ~/.bash_aliases
echo "alias dockprune='dockcprune && dockiprune && docknprune && docker ps -a'" >> ~/.bash_aliases
echo "alias explorer='xdg-open'" >> ~/.bash_aliases
echo "source ~/git-prompt.sh" >> ~/.bashrc

echo "download bash/zsh git prompt support by David Xu on github and place following line below previous line"
#echo "export PROMPT_COMMAND='__posh_git_ps1 "\[\e[0;33m\]\W>" " \[\e[1;34m\]\[\e[0m\]";'$PROMPT_COMMAND" >> ~/.bashrc

echo ". ~/.bashrc"
echo "alias"
echo "done with aliases"

echo "Installing webstorm..."
sudo snap install webstorm --classic
echo "Done with webstorm."

#echo "Installing VS Code..."
#echo "Done with VS code."

#echo "Installing chrome..."
## echo "Done with chrome..."

echo "A reboot is suggested."
