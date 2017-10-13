# Iterate over list of input structures; calculate partition function and produce thermodynamic weight

#units eV
kB=8.6173324E-5
T=300.0 #K

B=1/(T*kB) #300K * k_B in eV

# Read data and convert to Float64 type
En=readdlm("DisorderedCubicMAPI_finalEnergy.dat",Float64)

# Calculate partition Function (Z) with arbitrary precision arithmatic
Z=sum( [exp(BigFloat(-U*B)) for U in En[:,2] ] )

# Calculate densities / expectations for the samples, with this partition
p=[ exp(BigFloat(-U*B))/Z for U in En[:,2] ]

pcutoff=1e-5
@printf("# pcutoff: %f\n",pcutoff)

Ecutoff=-log(pcutoff*Z)/B
@printf("# Ecutoff: %f eV\n",Ecutoff)

GroundState=-log(1.0*Z)/B
@printf("# GroundState: %f eV\n",GroundState)

@printf("# Ecutoff-GroundState: %f eV\n",Ecutoff-GroundState)

# Iterate through (inelegantly) structures and output
@printf("# structures below pcutoff=%f in probability\n",pcutoff)
@printf("# Structure_num Energy Density\n")
for i in 1:size(En)[1]
    if (p[i]>pcutoff)
        @printf("%d %f %g\n",En[i,1],En[i,2],p[i])
    end
end

@printf("rm command to delete all the high energy structures:\n\n")
@printf("rm ")
for i in 1:size(En)[1]
    if (p[i]<=pcutoff)
        @printf("DisorderedCubicMAPI_%04D.xyz ",En[i,1])
    end
end
@printf("\n")

# Playing around with broadcasting... in pursuit of that perfect expression
#for (i,E) in enumerate(En[ p.>-1e-5 , : ])
#    @printf("%d %f %g\n",E[1,1],E[1,2],p[i])
#end

