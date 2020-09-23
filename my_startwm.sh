#!/bin/sh

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

function my_startx()
{
  if [ "$(id -u)" != "0" ] ; then
    which startx >> /dev/null 2>&1  && [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
  fi
}

function my_startsway()
{
  if [ "$(id -u)" != "0" ] ; then
    export MOZ_ENABLE_WAYLAND=1 # Enable wayland for firefox
    which sway >> /dev/null 2>&1  && [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && { sway ; exit ; }
  fi
}

function my_startwm()
{
  if which sway >> /dev/null 2>&1 ; then
      my_startsway
  else
      my_startx
  fi
}
