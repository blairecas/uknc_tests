@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ../scripts/preprocess.php tstton.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _tstton.lst _tstton.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ../scripts/lst2bin.php _tstton.lst ./release/tstton.sav sav

..\scripts\rt11dsk.exe d main.dsk .\release\tstton.sav >NUL
..\scripts\rt11dsk.exe a main.dsk .\release\tstton.sav >NUL

del _tstton.mac
del _tstton.lst

echo.