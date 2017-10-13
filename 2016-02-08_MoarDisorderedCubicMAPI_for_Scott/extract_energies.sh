echo "#Automatic extraction of final ion energy; PBESol 'free  energy' from VASP OUTCAR"

for count in `seq -w 1000 1100 ` `seq -w 0000 0150 `
do
 final_E=` grep "free  energy" "../MAPI/${count}"-opt/OUTCAR | tail -n1 | awk '{print $5}' `
 echo $count $final_E
done
