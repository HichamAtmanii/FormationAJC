@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon May 15 15:55:15 +0200 2023
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto 3c674d895f5c4291b0cc55bf950f0071 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_TP4_Fsm_behav xil_defaultlib.tb_TP4_Fsm -log elaborate.log"
call xelab  -wto 3c674d895f5c4291b0cc55bf950f0071 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_TP4_Fsm_behav xil_defaultlib.tb_TP4_Fsm -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0