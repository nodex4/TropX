#!/usr/bin/env bash


if [[ -z $(git status -s) ]]
then
  echo "up to date"
else
  echo "update pls"
fi