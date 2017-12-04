@ECHO off
SETlocal ENABLEDELAYEDEXPANSION
ECHO.
ECHO.
ECHO ______ __  __           ______ __      __  __  ______ ______
ECHO /\  ___/\ \/\ \         /\  ___/\ \    /\ \_\ \/\__  _/\__  _\
ECHO \ \  __\ \ \ \ \____    \ \  __\ \ \___\ \____ \/_/\ \\/_/\ \/
ECHO  \ \_\  \ \_\ \_____\    \ \_\  \ \_____\/\_____\ \ \_\  \ \_\
ECHO   \/_/   \/_/\/_____/     \/_/   \/_____/\/_____/  \/_/   \/_/
ECHO.
ECHO.
:: (SET /P j=Srouce: Organiserar) < NUL
(SET /P sourcePROMPT=Ursprung:    %~dp0) < NUL
ECHO.
(SET /P destPROMPT=Flytta till: %~dp0vlm) < NUL
ECHO.
SET i=10
(SET /P j=.) < NUL
SET sourcedir=%~dp0
SET destdir=%sourcedir%vlm
SET MAX=100
:Start
  call :DisplayProgressBar %i%
  ECHO.
  ECHO.
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
    IF NOT EXIST "%destdir%\!pid!\!id!\!res!\" MD "%destdir%\!pid!\!id!\!res!\"
    MOVE "%sourcedir%\%%a-%%b-%%c" "%destdir%\!pid!\!id!\!res!\%%a-%%b-%%c"
    SET /a i += 10
    if /i %i% leq 100 goto start
  )
  ECHO.
  ECHO.
  (SET /P j=Success!) < NUL
  ECHO.
  ::PAUSE>NUL
goto :EOF
:DisplayProgressBar
(SET /P j=.) < NUL
title %1%% Completed
EXIT /B
ENDLOCAL
