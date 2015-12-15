#    C    N    H    Pb   Br

cat  ~/Potpaw_PBE.52/C/POTCAR > POTCAR
cat  ~/Potpaw_PBE.52/N/POTCAR >> POTCAR
cat  ~/Potpaw_PBE.52/H/POTCAR >> POTCAR
cat  ~/Potpaw_PBE.52/Pb_d/POTCAR >> POTCAR
cat  ~/Potpaw_PBE.52/Br/POTCAR >> POTCAR


grep TITEL POTCAR # check by relisting atoms to STDOUT
