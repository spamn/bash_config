#!/bin/sh

export PATH=~/bin:$PATH

#if not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
