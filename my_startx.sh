#!/bin/sh

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

function my_startx()
{
  if [ "$(id -u)" != "0" ] ; then
    which startx >> /dev/null 2>&1  && [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
  fi
}
