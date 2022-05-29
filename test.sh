#!/usr/bin/env bash


if [[ -z $(git status -s) ]]; then
  echo "up to date"
else
  echo "update pls"
fi

output=$(git status -uno)
if [[ $output == *"commit"* ]]; then
  echo "update pls"
else  
  echo "uptodate"
fi
echo $output