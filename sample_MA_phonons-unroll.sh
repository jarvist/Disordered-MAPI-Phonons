# Disorder MA; running the Julia code to generate the 'disordered' POSCAR starter
# then output shell commands to run VASP-OPT calculation directly, then VASP Freq calculation
# designed to generate the files (with the Julia) then have a long 'job' shell list to execute on the generated directories
#   Hardcoded for WMD Scandium / Titanium workstations, but would be useful for standard clusters.

for i in ` seq -w 1000 1100 `
do
    optdir="${i}-opt"

    mkdir "${optdir}"
    julia  ~/VASP_LatheOfHeaven/rotate_MA_POSCAR.jl > "${optdir}/POSCAR"
    cp -a INCAR-opt "${optdir}/INCAR"
    cp -a POTCAR KPOINTS "${optdir}"

    echo cd "${optdir}"
    echo mpirun -np 24 /opt/vasp5.3.5-gamma
    echo cd "-"

    freqdir="${i}-freq"
    mkdir "${freqdir}"
    echo cp -a "${optdir}/CONTCAR" "${freqdir}/POSCAR"
    cp -a POTCAR KPOINTS "${freqdir}"
    cp -a INCAR-freq "${freqdir}/INCAR"

    echo cd "${freqdir}"
    echo mpirun -np 24 /opt/vasp5.3.5-gamma
    echo cd "-" 

done
