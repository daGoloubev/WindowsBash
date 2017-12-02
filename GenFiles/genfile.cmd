::===============================================================
:: This script generates an empty file with and .file extension
:: Given an input value as an parameter.
:: @author Daniel Rasmussen.
::===============================================================
@echo off
IF [%1] == [] GOTO DISPLAY
IF NOT [%1] == [] GOTO GEN

:DISPLAY
echo ERROR: Empty filename was given.
EXIT /B 0

:GEN
echo Generateing file: %1.file
copy NUL %1.file
EXIT /B 0
