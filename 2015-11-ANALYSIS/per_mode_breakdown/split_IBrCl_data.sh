for i in ` seq 33 `
do
 grep " ${i} f " ../I.dat > I_${i}.dat
 grep " ${i} f " ../Br.dat > Br_${i}.dat
 grep " ${i} f " ../Br-RETRY.dat > Br-RETRY_${i}.dat
 grep " ${i} f " ../Cl.dat > Cl_${i}.dat
done
