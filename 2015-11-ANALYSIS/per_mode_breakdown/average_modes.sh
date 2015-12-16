for a in I Br Cl
do
echo "Averaging phonon modes for ${a}..."
echo "" > "${a}_avg.dat"

for i in ` seq 33 `
do
    echo -n "${a} ${i} " >> "${a}_avg.dat"
 cat "${a}_${i}.dat" | awk 'BEGIN{c=0.0; n0;}{c+=$9; n++;}END{print c/n,n}' >> "${a}_avg.dat"
done

done
