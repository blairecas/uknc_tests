@echo off

echo.
echo ===========================================================================
echo Compiling 
echo ===========================================================================
php -f ../scripts/preprocess.php tstme2.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
..\scripts\macro11 -ysl 32 -yus -m ..\scripts\sysmac.sml -l _tstme2.lst _tstme2.mac
if %ERRORLEVEL% NEQ 0 ( exit /b )
php -f ../scripts/lst2bin.php _tstme2.lst ./release/tstme2.sav sav

..\scripts\rt11dsk.exe d main.dsk .\release\tstme2.sav >NUL
..\scripts\rt11dsk.exe a main.dsk .\release\tstme2.sav >NUL

del _tstme2.mac
del _tstme2.lst

echo.