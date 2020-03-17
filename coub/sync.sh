#!/bin/sh

if [[ "$1" == "up" ]]; then
  rsync -avzz --delete videos/ erebe@erebe.eu:Ressources/videos/
else
  rsync -avzz --delete erebe@erebe.eu:Ressources/videos/ videos/
fi 
