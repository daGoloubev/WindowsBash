:: ========================================================================= ::
:: Script for moving files.
:: Example string: vlm-kmvfe-2187
:: @author: Daniel Rasmussen
:: ======================================================================== ::
@echo off
setlocal enabledelayedexpansion
for /f %%f in ('dir /b ^| findstr /r "^test[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\.txt$"') do (
    set "filename=%%~nf"
    if not exist "!filename:~0,10!" md "!filename:~0,10!"
    move "%%~f" "!filename:~0,10!"
)
