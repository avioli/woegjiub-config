#! /usr/bin/env bash
ssh -F $XDG_CONFIG_HOME/ssh/config "$@" 2>/dev/null
exit
