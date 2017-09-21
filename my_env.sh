#!/bin/sh

export PATH=~/bin:$PATH

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

#Use gpg-agent for ssh
export GPG_TTY=$(tty)
which gpg-connect-agent > /dev/null 2>&1 && gpg-connect-agent updatestartuptty /bye >/dev/null
[ -e "/run/user/$UID/gnupg/S.gpg-agent.ssh" ] && export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"

which vim > /dev/null 2>&1 && export EDITOR=vim

_AWESOME_THEMES_PATH="$HOME/.config/awesome/themes"
[ -d "${_AWESOME_THEMES_PATH}" ] && export AWESOME_THEMES_PATH="${_AWESOME_THEMES_PATH}"
unset _AWESOME_THEMES_PATH
