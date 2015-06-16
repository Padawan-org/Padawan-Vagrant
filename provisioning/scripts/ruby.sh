echo "Install ruby"
sudo apt-get -qq -y install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
rvm install 2.2.2
rvm use 2.2.2 --default
ruby -v

echo "Install Bundler"
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
