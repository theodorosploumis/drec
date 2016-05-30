#!/usr/bin/env bash
# List all project settings

ls "$HOME"/.drec | egrep '\.drecfile' | sed -e 's/\..*$//'
