# # http://gmt.soest.hawaii.edu/doc/5.3.2/index.html check in this link for detail information about syntax used in this code, go to search box and look for the command like psbasemap, makecpt, grdimage, psxy, psscale, pscoast................

#!/bin/bash
projection=-JL12/35/1/85/7
region1=-R6.5/16.5/42.9/48.5
vscala=0.003

gmt psbasemap  $projection  $region1 -Bxa2 -Bya2 -V   -Y10  -K  >1.ps
awk '{print $2,$1,$3}' out_backdata_05892.txt | gmt xyz2grd   -Gm0_finale1.grd  -I0.1  -R -V>>1.ps
gmt makecpt -Cpolar -T-0.003/0.003/0.0001 -Z -D >thick.cpt
gmt grdimage m0_finale1.grd -Cthick.cpt -J  -R -BWeNs -V -E1000 -O  -K >>1.ps
echo 12.0 45.5 | gmt psxy  $projection  $region1 -Sc0.1 -W1,yellow -K -O -V >>1.ps
gmt psxy  station_loc_emilia.txt $projection -R  -Si0.12 -Gred -W1,black -O -K -V >>1.ps
gmt pscoast $projection  $region1 -Di -W0.1p -A1000 -N1/0.1p -V -O -K  >>1.ps
gmt pstext $projection  -R -K -O -F+f10p,Helvetica-Bold,brown <<EOF>> 1.ps
15.5 43.5 $time2 s
EOF
gmt psscale -C$cpt_file -D4.1/-1/3/0.25h   -B$vscala:" ":  -E  -O -V >>1.ps
gmt psconvert -A -E500/500 -Tg -P 1.ps
