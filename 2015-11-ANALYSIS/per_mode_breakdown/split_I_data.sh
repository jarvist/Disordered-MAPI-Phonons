for i in ` seq 33 `
do
 grep " ${i} f " I.dat > I_${i}.dat
 echo "    \'I_${i}.dat\' using (bin($9,binwidth)):(1.0) smooth freq with boxes lc ${i},\\"
done
