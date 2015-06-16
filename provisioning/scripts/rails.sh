echo "Install rails"
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get -qq -y install nodejs

echo "Install Rails gem"
gem install rails -v 4.2.1
rails -v
