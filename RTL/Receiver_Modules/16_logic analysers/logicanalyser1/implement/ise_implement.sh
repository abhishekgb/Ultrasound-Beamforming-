#!/bin/bash
################################################################################
##   ____  ____
##  /   /\/   /
## /___/  \  /    Vendor: Xilinx
## \   \   \/     Version : 1.05
##  \   \         Application : ILA v1.05_a Core
##  /   /         Filename : ise_implement.sh
## /___/   /\     
## \   \  /  \
##  \___\/\___\
##
##
## ise_implement.sh script 
## Generated by Xilinx ILA v1.05_a Core
##
#-----------------------------------------------------------------------------
# Script to synthesize and implement the RTL provided for the ILA core
#-----------------------------------------------------------------------------
#Exit on Error enabled.
set -o errexit

#Create results directory
rm -rf results
mkdir results

echo 'Running Coregen on ICON required for example design'
coregen -b chipscope_icon.xco -p coregen.cgp
# Check Results
if [ $? -gt 0 ] ; then 
echo An error occurred running Coregen on ICON
echo FAIL
exit
fi

cp ../../logicanalyser1.ngc .

##-------------------------------Run Xst on Example design----------------------------
echo 'Running Xst on example design'
xst -ifn example_logicanalyser1.xst -ofn example_core.log -intstyle silent
# Check Results
if [ $? -gt 0 ] ; then 
echo An error occurred running XST on example_logicanalyser1
echo FAIL
exit
fi

cp chipscope_icon.ngc ./results

cp ../../logicanalyser1.ngc        ./results
cp example_logicanalyser1.ngc        ./results
cp chipscope_icon.ncf ./results
cp ../../logicanalyser1.ncf        ./results
cd ./results
##-------------------------------Run ngdbuild---------------------------------------
echo 'Running ngdbuild'
ngdbuild -uc ../../example_design/example_logicanalyser1.ucf -p xc5vlx50-ff676-1 -sd . example_logicanalyser1.ngc example_logicanalyser1.ngd
if [ $? -gt 0 ] ; then 
echo An error occurred running NGDBUILD on example_logicanalyser1 
echo FAIL
exit
fi
#end run ngdbuild section
##-------------------------------Run map-------------------------------------------
echo 'Running map'
map -w -p xc5vlx50-ff676-1 -o example_logicanalyser1.map.ncd example_logicanalyser1.ngd
if [ $? -gt 0 ] ; then 
echo An error occurred running MAP on example_logicanalyser1 
echo FAIL
exit
fi
##-------------------------------Run par-------------------------------------------
echo 'Running par'
par -w -ol high example_logicanalyser1.map.ncd example_logicanalyser1.ncd 
if [ $? -gt 0 ] ; then 
echo An error occurred running PAR on example_logicanalyser1 
echo FAIL
exit
fi
##---------------------------Report par results-------------------------------------
echo 'Running design through bitgen'
bitgen -d -g GWE_cycle:Done -g GTS_cycle:Done -g DriveDone:Yes -g StartupClk:Cclk -w example_logicanalyser1.ncd
if [ $? -gt 0 ] ; then 
echo An error occurred running BITGEN on example_logicanalyser1 
echo FAIL
exit
else
echo PASS
exit
fi