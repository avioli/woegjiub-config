#! /usr/bin/env bash
ssh -F $XDG_CONFIG_HOME/ssh/config "$@"
exit
