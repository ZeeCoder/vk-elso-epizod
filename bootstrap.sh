#!/usr/bin/env bash

apt-get update
apt-get install -y ruby
apt-get install -y curl
#apt-get install -y language-pack-hu
apt-get install -y ruby-dev
gem install rvpacker

sudo locale-gen hu_HU.UTF-8
sudo dpkg-reconfigure locales
