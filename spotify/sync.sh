#!/bin/sh

rsync -avz erebe@erebe.eu:Ressources/covers/ covers/
rsync -avz --delete covers/ erebe@erebe.eu:Ressources/covers/

