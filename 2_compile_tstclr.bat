@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ../scripts/preprocess.php tstclr.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _tstclr.lst _tstclr.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ../scripts/lst2bin.php _tstclr.lst ./release/tstclr.sav sav

..\scripts\rt11dsk.exe d main.dsk .\release\tstclr.sav >NUL
..\scripts\rt11dsk.exe a main.dsk .\release\tstclr.sav >NUL

del _tstclr.mac
del _tstclr.lst

echo.