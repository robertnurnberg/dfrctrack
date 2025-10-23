#!/bin/bash

python ../caissatrack/plotdata.py dfrctrack.csv --cutOff 300 --negplot -ll --edgeMin 90 --edgeMax 105

python ../caissatrack/plotdata.py frctrack.csv --negplot -ll --edgeMin 80 --edgeMax 115

python ../caissatrack/plotdata.py chess324track.csv --cutOff 150 --negplot -ll --edgeMin 90 --edgeMax 105

git add dfrctrack.png dfrctrackpv.png dfrctracktime.png
git add frctrack.png frctrackpv.png frctracktime.png
git add chess324track.png chess324trackpv.png chess324tracktime.png
git diff --staged --quiet || git commit -m "update plots"
git push origin main >&push.log
