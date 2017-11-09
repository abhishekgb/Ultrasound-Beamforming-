REM
REM   ____  ____
REM  /   /\/   /
REM /___/  \  /    Vendor: Xilinx
REM \   \   \/     Version : 1.05
REM  \   \         Application : ILA v1.05_a Core
REM  /   /         Filename : ise_implement.bat
REM /___/   /\     
REM \   \  /  \
REM  \___\/\___\
REM
REM
REM ise_implement.bat script
REM Generated by Xilinx ILA v1.05_a Core
REM

REM Clean results directory
REM Create results directory
REM Change current directory to results
ECHO WARNING: Removing existing results directory
RMDIR /S /Q results
MKDIR results

ECHO 'Running coregen on ICON required for example design'
coregen -b chipscope_icon.xco -p coregen.cgp
REM Check Results
IF ERRORLEVEL 0 GOTO PASS_COREGEN_ICON
ECHO An error occurred running coregen on ICON
GOTO END_IMPLEMENT_FAIL
:PASS_COREGEN_ICON

COPY ..\..\logicanalyser1.ngc .      

REM RUN Xst
ECHO 'Running Xst on Example Design'
xst -ifn example_logicanalyser1.xst -ofn example_core.log -intstyle silent
REM Check Results
IF ERRORLEVEL 0 GOTO PASS_XST
ECHO An error occurred running XST on example_logicanalyser1
GOTO END_IMPLEMENT_FAIL
:PASS_XST


REM Copy NGC Files
COPY chipscope_icon.ngc  .\results\

COPY ..\..\logicanalyser1.ngc        .\results\
COPY example_logicanalyser1.ngc        .\results\
COPY chipscope_icon.ncf .\results\
COPY ..\..\logicanalyser1.ncf        .\results\
cd .\results

REM Run ngdbuild
ECHO 'Running NGDBUILD'
ngdbuild -uc ..\..\example_design\example_logicanalyser1.ucf -p xc5vlx50-ff676-1 -sd . example_logicanalyser1.ngc example_logicanalyser1.ngd
REM Check Results
IF ERRORLEVEL 0 GOTO PASS_NGDBUILD
ECHO An error occurred running NGDBUILD on example_logicanalyser1
GOTO END_IMPLEMENT_FAIL
:PASS_NGDBUILD
REM end run ngdbuild section

REM Run map
ECHO 'Running MAP'
map -w -p xc5vlx50-ff676-1 -o example_logicanalyser1.map.ncd example_logicanalyser1.ngd
REM Check Results
IF ERRORLEVEL 0 GOTO PASS_MAP
ECHO An error occurred running MAP on example_logicanalyser1
GOTO END_IMPLEMENT_FAIL
:PASS_MAP

REM Run par
ECHO 'Running PAR'
par -w -ol high example_logicanalyser1.map.ncd example_logicanalyser1.ncd 
REM Check Results
IF ERRORLEVEL 0 GOTO PASS_PAR
ECHO An error occurred running PAR on example_logicanalyser1
GOTO END_IMPLEMENT_FAIL
:PASS_PAR
REM Report par results

ECHO 'Running design through BITGEN'
bitgen -d -g GWE_cycle:Done -g GTS_cycle:Done -g DriveDone:Yes -g StartupClk:Cclk -w example_logicanalyser1.ncd
REM Check Results
IF ERRORLEVEL 0 GOTO PASS_BITGEN
ECHO An error occurred running BITGEN on example_logicanalyser1
GOTO END_IMPLEMENT_FAIL
:PASS_BITGEN

:END_IMPLEMENT_PASS
@CD ..
@ECHO PASS
@EXIT /B 0

:END_IMPLEMENT_FAIL
CD ..
ECHO FAIL
EXIT /B 1