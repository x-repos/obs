#!/bin/sh
base=/media/hthapa/Seagate/zz_auto_Rwanda/synthetic_test/0-codes
tarpath=/media/hthapa/Seagate/zz_auto_Rwanda/synthetic_test/test_IR
for i in `seq 1 5`;do
gcarc=30
evdp=20
rayp=`udtdd -GCARC $gcarc -EVDP $depth`
new_rayp=`printf '%.5f\n' "$rayp"`
./respknt <<EON
smp.mod
y
1
0.025
200
$new_rayp
f
y
EON
done
cp smp.mod_BHZ.sac $tarpath/smp.mod_BHZ_$new_rayp.sac
cp smp.mod_BHN.sac $tarpath/smp.mod_BHN_$new_rayp.sac
