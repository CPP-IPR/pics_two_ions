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
TIMESTEP[0]=1000;

PERCENT[0]=0.8
PERCENT[1]=0.5
PERCENT[2]=0.3

ATOMIC_WEIGHT_ION[0]=8.0
ATOMIC_WEIGHT_ION[1]=4.0

VDF_LOC[0] = 0.001
VDF_LOC[1] = 0.0012

DIR[0]="run1"
DIR[1]="run2"
DIR[2]="run3"
######################################################
#
#            COMPILATION
#
#####################################################
touch input.txt
echo "Compiling the SOURCE CODE"
g++ -std=c++11 two_ions_v3.cpp
######################################################
#
#             Input File Creation
#
#####################################################
for i in $(seq 0 1 2)
do
rm input.txt
touch input.txt
echo "Final_Time_Step" >> input.txt
echo "${TIMESTEP[0]}" >> input.txt
echo "Percentage_of_first_ions" >> input.txt
echo "${PERCENT[$i]}" >> input.txt
echo "Atomic_weight_of_heavier_ion" >> input.txt
echo "${ATOMIC_WEIGHT_ION[0]}" >> input.txt
echo "Atomic_weight_of_lighter_ion" >> input.txt
echo "${ATOMIC_WEIGHT_ION[1]}" >> input.txt
echo "VDF_location_1" >> input.txt
echo "${VDF_LOC[0]}" >> input.txt
echo "VDF_location_2" >> input.txt
echo "${VDF_LOC[1]}" >> input.txt
echo "Congrats!Input file has been successfully created."
######################################################
#
#             RUN
#
#####################################################
echo "Running ......."
./a.out
######################################################

echo "RUN - ${i} COMPLETED"
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
done
echo "ALL DONE!!!!!"
########
