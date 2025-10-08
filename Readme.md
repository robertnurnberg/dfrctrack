# dfrctrack

Track the evaluations of the
[DFRC](https://en.wikipedia.org/wiki/Chess960) (Double Fischer Random Chess)
opening positions on [chessdb.cn](https://chessdb.cn/queryc_en/) (cdb).
The order of the openings in [`DFRC_openings.epd.gz`](DFRC_openings.epd.gz)
and [`FRC_openings.epd.gz`](FRC_openings.epd.gz) is inherited from the original
files at 
[official-stockfish/books](https://github.com/official-stockfish/books).

The file [`DFRC_openings_cdbpv.epd.gz`](DFRC_openings_cdbpv.epd.gz) 
contains the current cdb evaluations and PVs for each opening. It is created 
weekly with the help of the script `cdbbulkpv.py` from 
[cdblib](https://github.com/robertnurnberg/cdblib), and the obtained statistics
are written to [`dfrctrack.csv`](dfrctrack.csv), and similarly for
[`frctrack.csv`](frctrack.csv).

Moreover, each week the hundred positions with the currently shortest PVs on cdb
(ignoring PVs ending in a two-fold repetition)
are written to [`dfrc_weekly_shortest.epd`](dfrc_weekly_shortest.epd), and
the positions with absolute evaluations in the interval [90, 105]
are written to [`dfrc_weekly_edgy.epd`](dfrc_weekly_edgy.epd).

---

<p align="center"> <img src="dfrctrack.png?raw=true"> </p>

---

<p align="center"> <img src="dfrctrackpv.png?raw=true"> </p>

---

### FRC

<p align="center"> <img src="frctrack.png?raw=true"> </p>

---

<p align="center"> <img src="frctrackpv.png?raw=true"> </p>

---

## Progress

The following graphs attempt to measure the progress cdb makes in exploring
and evaluating the positions in `DFRC_openings.epd` and `FRC_openings.epd`,
respectively. See
[caissatrack](https://github.com/robertnurnberg/caissatrack)
for a precise description of the plotted indicators.

<p align="center"> <img src="dfrctracktime.png?raw=true"> </p>

---

### FRC

<p align="center"> <img src="frctracktime.png?raw=true"> </p>

---

## Get in touch

To discuss anything cdb related, and to help cdb grow at a healthy pace, join
other (computer) chess enthusiasts at the [chessdbcn channel](
https://discord.com/channels/435943710472011776/1101022188313772083) on the
[Stockfish discord server](https://discord.gg/ZzJwPv3).
