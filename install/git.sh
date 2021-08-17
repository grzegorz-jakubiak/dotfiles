#!/usr/bin/env bash

printf "Setting up Git...\\n\\n"

defaultName=$( git config --global user.name )
defaultEmail=$( git config --global user.email )

read -rp "Name [$defaultName] " name
read -rp "Email [$defaultEmail] " email

git config --global user.name "${name:-$defaultName}"
git config --global user.email "${email:-$defaultEmail}"
git config --global github.user "${github:-$defaultGithub}"

