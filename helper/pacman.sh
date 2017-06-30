#!/bin/sh

. ./helper/cmd.sh

pacman_update() {
  name="Update packages"
  eval_cmd "$name" "sudo pacman -Syu --noconfirm"
}

pacman_install() {
  name="Install $1"
  eval_cmd "$name" "sudo pacman -S --noconfirm $1"
}
