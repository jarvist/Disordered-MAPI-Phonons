for count in `seq -w 1000 1100 ` `seq -w 0100 0150 `
do
 echo $count
 babel -i VASP "../MAPI/${count}"-opt/CONTCAR -o xyz DisorderedCubicMAPI_$count.xyz
done
