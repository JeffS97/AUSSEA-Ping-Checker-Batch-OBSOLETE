@Echo off
REM This batch script is used to ping the Brawlhalla servers
REM Written by Tiger (Jeff)
REM 8th November 2016
REM Rendered obsolete with java program - 4 June 2018

Set cfg=Pingcfg.txt
setlocal EnableDelayedExpansion

if not exist %cfg% (echo Generating config file...& echo Please specify the path and file name for the log file& Set /p tpath=Enter Path:& Set /p tfilename=Enter Filename:& echo !tpath!\!tfilename!.txt> !cfg!)
for /f "tokens=*" %%a in (%cfg%) do (Set out=%%a)

echo Your Selected Path is: %out%
echo If you wish to change this, please delete the "Pingcfg.txt" file in the same directory as this script.

Set separate=-------------------------------------------------------------
set logdate=%date:~4%
set logtime=%time:~0,5%

Echo ========SEA Servers======== > %out%
ping pingtest-sgp.brawlhalla.com -n 5 >> %out%
Echo %separate% >> %out%

Echo ========AUS Servers======== >> %out%
ping pingtest-aus.brawlhalla.com -n 5 >> %out%
Echo %separate% >> %out%

Echo: >> %out%
Echo Pinglog as of: %logdate%, %logtime% >> %out%

start notepad %out%

REM timeout 5 >nul
REM del %out%