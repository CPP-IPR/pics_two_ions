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
######################################################
#
#		     RUN - 1
#
#####################################################
rm input.txt
touch input.txt
echo "Percentage_of_first_ions" >> input.txt
echo "0.8" >> input.txt
echo "Atomic_weight_of_heavier_ion" >> input.txt
echo "8.0" >> input.txt
echo "Atomic_weight_of_lighter_ion" >> input.txt
echo "4.0" >> input.txt
echo "Congrats!Input file has been successfully created."

#######################################################
echo "Compiling the SOURCE CODE"
g++ -std=c++11 two_ions_v2.cpp
echo "Running ......."
./a.out
######################################################

echo "FIRST RUN COMPLETED"
echo "MOVING DATA"
mkdir run1
mv output run1/output
mv part.dat run1/part.dat
mv results.dat run1/results.dat
mv ke.dat run1/ke.dat
echo "DATA STORED SUCCESSFULLY"
echo "MOVING EXECUTABLES AND INPUT FILES"
cp a.out run1/
cp input.txt run1/
echo "DONE!"
echo "COPYING MATLAB FILES......"
cp diagnostics/* run1/
echo "DONE!"

#######################################################
######################################################
#
#             RUN - 2
#
#####################################################
rm input.txt
touch input.txt
echo "Percentage_of_first_ions" >> input.txt
echo "0.5" >> input.txt
echo "Atomic_weight_of_heavier_ion" >> input.txt
echo "8.0" >> input.txt
echo "Atomic_weight_of_lighter_ion" >> input.txt
echo "4.0" >> input.txt
echo "Congrats!Input file has been successfully created."

#######################################################
echo "Compiling the SOURCE CODE"
g++ -std=c++11 two_ions_v2.cpp
echo "Running ......."
./a.out
######################################################

echo "SECOND RUN COMPLETED"
echo "MOVING DATA"
mkdir run2
mv output run2/output
mv part.dat run2/part.dat
mv results.dat run2/results.dat
mv ke.dat run2/ke.dat
echo "DATA STORED SUCCESSFULLY"
echo "MOVING EXECUTABLES AND INPUT FILES"
cp a.out run2/
cp input.txt run2/
echo "DONE!"
echo "COPYING MATLAB FILES......"
cp diagnostics/* run2/
echo "DONE!"

#######################################################
######################################################
#
#             RUN - 3
#
#####################################################
rm input.txt
touch input.txt
echo "Percentage_of_first_ions" >> input.txt
echo "0.3" >> input.txt
echo "Atomic_weight_of_heavier_ion" >> input.txt
echo "8.0" >> input.txt
echo "Atomic_weight_of_lighter_ion" >> input.txt
echo "4.0" >> input.txt
echo "Congrats!Input file has been successfully created."

#######################################################
echo "Compiling the SOURCE CODE"
g++ -std=c++11 two_ions_v2.cpp
echo "Running ......."
./a.out
######################################################

echo "FIRST RUN COMPLETED"
echo "MOVING DATA"
mkdir run3
mv output run3/output
mv part.dat run3/part.dat
mv results.dat run3/results.dat
mv ke.dat run3/ke.dat
echo "DATA STORED SUCCESSFULLY"
echo "MOVING EXECUTABLES AND INPUT FILES"
cp a.out run3/
cp input.txt run3/
echo "DONE!"
echo "COPYING MATLAB FILES......"
cp diagnostics/* run3/
echo "DONE!"

#######################################################
echo "ALL DONE!!!!!"
