echo "Install jenkins"
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
echo "deb http://pkg.jenkins-ci.org/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins-ci.list
sudo apt-get -qq update
sudo apt-get -qq -y install jenkins
