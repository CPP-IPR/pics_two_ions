#! /bin/bash
#####################################################
clear
echo "*****************************************"
echo "*********** WELCOME TO PICS2i ***********"
echo "*****************************************"
echo "Developers: Dr. R. Moulick, LPU and Mr. S. Adhikari, CPP-IPR"
echo "#############################################################"
echo "Housekeeping in progress....."
rm -rf run1 run2 run3
echo "Housekeeping Completed!"
################ INITIALIZATION #######################
PERCENT[0]=0.8
PERCENT[1]=0.5
PERCENT[2]=0.3

ATOMIC_WEIGHT_ION[0]=8.0
ATOMIC_WEIGHT_ION[1]=4.0

DIR[0]="run1"
DIR[1]="run2"
DIR[2]="run3"
######################################################
#
#		     RUN - 1
#
#####################################################
for i in $(seq 0 1 2)
    do
    rm input.txt
    touch input.txt
    echo "Percentage_of_first_ions" >> input.txt
    echo "${PERCENT[$i]}" >> input.txt
    echo "Atomic_weight_of_heavier_ion" >> input.txt
    echo "${ATOMIC_WEIGHT_ION[0]}" >> input.txt
    echo "Atomic_weight_of_lighter_ion" >> input.txt
    echo "${ATOMIC_WEIGHT_ION[1]}" >> input.txt
    echo "Congrats!Input file has been successfully created."

    #######################################################
    echo "Compiling the SOURCE CODE"
    g++ -std=c++11 two_ions_v2.cpp
    echo "Running ......."
    ./a.out
    ######################################################

    echo "FIRST RUN COMPLETED"
    echo "MOVING DATA"
    mkdir ${DIR[$i]}
    mv output ${DIR[$i]}/output
    cp *.dat ${DIR[$i]}/
    rm *.dat

    echo "DATA STORED SUCCESSFULLY"
    echo "MOVING EXECUTABLES AND INPUT FILES"
    cp a.out ${DIR[$i]}/
    cp input.txt ${DIR[$i]}/
    echo "DONE!"
    echo "COPYING MATLAB FILES......"
    cp diagnostics/* ${DIR[$i]}/
    echo "DONE!"
    echo ">>>>>>>>>>>>>>>PLOTTING SOME DATAS>>>>>>>>>>>>>>>>>"
    echo "Wait................"
    cd ${DIR[$i]}/
    #/Applications/MATLAB_R2014b.app/bin/matlab -nodesktop -nosplash -r "plot_res; exit;"
    matlab -nodesktop -nosplash -r "plot_res; exit;"
    matlab -nodesktop -nosplash -r "dist_part; exit;"
    cd ..
    echo "DONE!"
    echo "COPYING PLOTS TO GIT....."
    cd ${DIR[$i]}/
    git add *.png
    git commit -m "Plots from ${DIR[$i]}"
    git push
    cd ..
    echo "DONE!"
    done
#######################################################

#######################################################
echo "ALL DONE!!!!!"
