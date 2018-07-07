#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run xset m 00 r rate 250 25
run setxkbmap -model pc104 -layout us,ru -variant qwerty -option grp:alt_shift_toggle -option caps:ctrl_modifier
run compton
run "redshift -x && redshift -O 5000"
