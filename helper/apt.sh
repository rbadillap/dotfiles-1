#!/bin/sh

. ./helper/cmd.sh

apt_update() {
  name="Update packages"
  eval_cmd "$name" "sudo apt upgrade"
}

apt_install() {
  name="Install $1"
  eval_cmd "$name" "sudo apt -y --force-yes install $1"
}

apt_add_ppa() {
  name="Add ppa:$1"
  eval_cmd "$name" "sudo add-apt-repository -y ppa:$1"
  name="Update repositories"
  eval_cmd "$name" "sudo apt update"
}
