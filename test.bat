@echo off
call .\resources\tests\%1\run.bat
echo Test executed, next step will be cleanup.
pause
call .\resources\tests\%1\clean.bat
echo Test complete.