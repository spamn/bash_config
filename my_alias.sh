#!/bin/sh

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pacman='pacman --color=auto'
alias grep='grep --color=auto'
alias rgrep='grep -Rn'
