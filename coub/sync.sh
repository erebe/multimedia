#!/bin/sh

rsync -avz --delete erebe@erebe.eu:Ressources/videos/ videos/
rsync -avz --delete videos/ erebe@erebe.eu:Ressources/videos/

