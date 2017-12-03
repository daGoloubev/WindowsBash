:: ========================================================================= ::
:: Script for moving files.
:: Example string: vlm-kmvfe-2187
:: @author: Daniel Rasmussen
:: ======================================================================== ::
@ECHO off
SETLOCAL ENABLEDELAYEDEXPANSION
SET sourcedir=%~dp0
SET destdir=%sourcedir%vlm
SET MAX=100
FOR /f "delims=- tokens=1-3" %%a IN (
    'dir /b /a-d "%sourcedir%\vlm-*-*.*"'
  ) DO IF "%%c" neq "" (
    SET mid=%%b
    SET pid=!mid:~0,3!
    SET id=!mid:~3!
    SET last=%%c
    SET nbr=!last:~0,-5!
    SET /a res = !nbr! / !MAX!
    SET /a res = !res! * !MAX!
    MD "%destdir%\!pid!\!id!\!res!\"
    MOVE "%sourcedir%\%%a-%%b-%%c" "%destdir%\!pid!\!id!\!res!\%%a-%%b-%%c"
  )

GOTO :EOF
