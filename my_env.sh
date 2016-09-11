#!/bin/sh

export PATH=~/bin:$PATH

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

which vim >> /dev/null 2>&1 && export EDITOR=vim
