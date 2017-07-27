#!/bin/sh

. ./helper/cmd.sh

gpg_import() {
  name="Import $(basename "$1")"

  echo "CHECK IF ALREADY EXISTS AND SKIP"
  eval_cmd "$name" "gpg --import $1"
}