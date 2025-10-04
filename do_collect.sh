#!/bin/bash

# exit on errors
set -e

TEMP_FILE="_tmp_dfrc_cdbpv.epd"
SCORE="python ../cdblib/addons/score_fens_locally.py"

if [ -f "$TEMP_FILE" ]; then
    echo "$TEMP_FILE already exists. Exiting."
    exit 0
fi

python ../cdblib/cdbbulkpv.py -s -c 8 --stable --user rob DFRC_openings.epd.gz >"$TEMP_FILE"

$SCORE FRC_openings.epd.gz $TEMP_FILE >FRC_openings_cdbpv.epd
mv "$TEMP_FILE" DFRC_openings_cdbpv.epd
gzip -9 DFRC_openings_cdbpv.epd

python ../caissatrack/caissatrack.py DFRC_openings_cdbpv.epd >>dfrctrack.csv
python ../caissatrack/caissatrack.py FRC_openings_cdbpv.epd >>frctrack.csv
python ../caissatrack/extract_fens.py DFRC_openings_cdbpv.epd --shortest 100 --ignore2folds >dfrc_weekly_shortest.epd
python ../caissatrack/extract_fens.py DFRC_openings_cdbpv.epd --evalMin 90 --evalMax 105 >dfrc_weekly_edgy.epd

git add DFRC_openings_cdbpv.epd.gz FRC_openings_cdbpv.epd dfrctrack.csv frctrack.csv dfrc_weekly_shortest.epd dfrc_weekly_edgy.epd
git diff --staged --quiet || git commit -m "update data"
git push origin main >&push.log
