ezgo-image
==========

ezgo image 自動產生器

安裝
====
* Docker
  http://docs.docker.io/en/latest/installation/ubuntulinux/
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
  sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
  sudo apt-get update
  sudo apt-get install lxc-docker

用法
====
* ./docker.sh

除錯
===
* Dockerfile
* sudo docker run -privileged -i -t ezgo-image bash
