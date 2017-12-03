::===============================================================
:: This script generates the given amount, read via the input
:: parameter.
:: @author Daniel Rasmussen.
::===============================================================
@echo off
IF [%1] == [] GOTO DISPLAY
IF NOT [%1] == [] GOTO GEN

:DISPLAY
echo ERROR: 0 amount was given.
EXIT /B 0

:GEN
:: TODO Create generators for namn and id.
rm *.files
set prefix=vlm-
set namn=kmv
set id=dr-

echo Generating %1 files:
@echo off
for /l %%x in (1,1,%1) do (
  genfile %prefix%%namn%%id%%%x
)
EXIT /B 0
