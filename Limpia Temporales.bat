@echo off
title Limpiador de Temporales - Pablo Demateo
mode con: cols=80 lines=40

:: Elevación de permisos
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Necesito permisos de administrador. Elevando...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%~f0'"
    exit /b
)

:menu
cls
echo.
echo    [38;5;14m=== Limpiador de Temporales - Pablo Demateo ===[0m
echo.
echo    [38;5;10m[1][0m [38;5;14mLimpiar temporales %% temp %%[0m
echo    [38;5;10m[2][0m [38;5;14mLimpiar temporales %% windir %%\temp[0m
echo    [38;5;10m[3][0m [38;5;14mLimpiar con cleanmgr[0m
echo    [38;5;10m[4][0m [38;5;14mLimpiar todo[0m
echo    [38;5;10m[5][0m [38;5;14mConfigurar cleanmgr /sageset:1[0m
echo    [38;5;10m[0][0m [38;5;14mSalir[0m
echo.

choice /c 012345 /n /m "     -> Elegi una opcion: "
set opcion=%errorlevel%

if "%opcion%"=="2" (
    call :clearTemp
    goto menu
)
if "%opcion%"=="3" (
    call :checkSagerunConfig
    if "%sagerunConfig%"=="no" (
        echo.
        echo    El cleanmgr con sagerun:1 no está configurado.
        echo    Ejecuta primero: cleanmgr /sageset:1 y marca todos los casilleros
        pause
        goto menu
    )
    call :runCleanmgr
    goto menu
)
if "%opcion%"=="4" (
    call :runCleanmgr
    goto menu
)
if "%opcion%"=="5" (
    call :clearTemp
    call :clearWindirTemp
    call :runCleanmgr
    goto menu
)
if "%opcion%"=="6" (
    call :runCleanmgrSageset
    goto menu
)
if "%opcion%"=="1" (
    echo.
    echo    Saliendo...
    timeout /t 1 /nobreak >nul
    exit
)

echo.
echo    Opción inválida. Probá de nuevo.
timeout /t 1 /nobreak >nul
goto menu

:clearTemp
cls
echo.
echo    Limpiando %%temp%%...
del /s /q /f "%temp%\*" >nul 2>&1
echo    Listo.
timeout /t 1 /nobreak >nul
exit /b

:clearWindirTemp
cls
echo.
echo    Limpiando %%windir%%\temp...
del /s /q /f "%windir%\temp\*" >nul 2>&1
echo    Listo.
timeout /t 1 /nobreak >nul
exit /b

:runCleanmgr
cls
echo.
echo    Ejecutando cleanmgr...
cleanmgr /sagerun:1
echo    Listo.
timeout /t 1 /nobreak >nul
exit /b

:runCleanmgrSageset
cls
echo.
echo    Ejecutando configuracion de cleanmgr sagerun:1...
cleanmgr /sageset:1
echo    Listo.
timeout /t 1 /nobreak >nul
exit /b

:checkSagerunConfig
set "sagerunConfig=no"
for /f "tokens=*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches" /s /f "StateFlags0001" 2^>nul') do (
    set "sagerunConfig=yes"
    goto :eof
)
:eof
exit /b
