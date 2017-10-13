# Code to strip out the Frequencies from a VASP Phonon calculation, and do stats on the modes (average, count and Standard Deviation)
# I wrote the code to do the stats, so it may be wrong :^) -- Jarv

for HALOGEN in MAPI MAPBr MAPBr-RETRY MAPCl  
do
    for mode in ` seq 33 `
    do
        echo -n "Halogen: ${HALOGEN} Mode: ${mode} "
        grep " ${mode} f  =" "../${HALOGEN}/"????-freq/OUTCAR | awk '{c+=$9;cs+=$9*$9}END{print "avg: ",c/NR,"count:",NR,"sigma:",sqrt(cs/NR - (c/NR)**2)}'
    done
done
