# Disorder MA; run VASP-OPT calculation directly, then VASP Freq calculation
#   Hardcoded for WMD Scandium / Titanium workstations

for i in ` seq -w 1000 `
do
    optdir="${i}-opt"

    mkdir "${optdir}"
    julia  ~/VASP_LatheOfHeaven/rotate_MA_POSCAR.jl > "${optdir}/POSCAR"
    cp -a INCAR-opt "${optdir}/INCAR"
    cp -a POTCAR KPOINTS "${optdir}"

    cd "${optdir}"
    mpirun -np 24 /opt/vasp5.3.5-gamma
    cd "-"

    freqdir="${i}-freq"
    mkdir "${freqdir}"
    cp -a "${optdir}/CONTCAR" "${freqdir}/POSCAR"
    cp -a POTCAR KPOINTS "${freqdir}"
    cp -a INCAR-freq "${freqdir}/INCAR"

    cd "${freqdir}"
    mpirun -np 24 /opt/vasp5.3.5-gamma
    cd "-" 

done
