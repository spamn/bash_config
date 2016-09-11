#!/bin/sh

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

MY_DEFAULT_FORMAT='\[\e[0m\]'

#Green for normal user
MY_USER_FORMAT='\[\e[1;32m\]'

if [ "$(id -u)" == "0" ] ; then
  #Red for root
  MY_USER_FORMAT='\[\e[1;31m\]'
fi

MY_HOST_SUM=$(echo $HOSTNAME | md5sum)
MY_HOST_R=$(printf "%d" 0x${MY_HOST_SUM:0:2})
MY_HOST_G=$(printf "%d" 0x${MY_HOST_SUM:2:2})
MY_HOST_B=$(printf "%d" 0x${MY_HOST_SUM:4:2})

#I use dark background so color must be clear enough
MY_MIN_COLOR=128
if [ $(( $MY_HOST_R + $MY_HOST_G + $MY_HOST_B )) -lt $MY_MIN_COLOR ] ; then
  MY_DIFF=$(( ($MY_MIN_COLOR - $MY_HOST_R - $MY_HOST_G - $MY_HOST_B ) / 3 ))
  MY_HOST_R=$(( $MY_HOST_R + $MY_DIFF ))
  MY_HOST_G=$(( $MY_HOST_G + $MY_DIFF ))
  MY_HOST_B=$(( $MY_HOST_B + $MY_DIFF ))
fi

MY_HOSTNAME_FORMAT=$(printf '\[\x1b[38;2;%d;%d;%dm\]' $MY_HOST_R $MY_HOST_G $MY_HOST_B)

MY_WD_FORMAT='\[\e[0;34m\]'

PS1="${MY_USER_FORMAT}\u${MY_DEFAULT_FORMAT}@\
${MY_HOSTNAME_FORMAT}\h${MY_DEFAULT_FORMAT} \
${MY_WD_FORMAT}\w${MY_DEFAULT_FORMAT} \
\$ "
