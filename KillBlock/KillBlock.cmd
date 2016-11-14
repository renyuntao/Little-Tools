@echo off

set process_name="mysqlload.exe"
set log_file_name="KillBlock.log"

echo Start the program...
echo %DATE% %TIME% Start the program... >> %log_file_name%

::****************************** While Statement *************************************
:while
tasklist | find %process_name% 

::********** If find, then the %ERRORLEVEL% == 0 ************
if %ERRORLEVEL% == 0 (
	
	echo %DATE% %TIME% kill %process_name% >> %log_file_name%
	taskkill /im %process_name%

) else (
	
	echo %DATE% %TIME% not find %process_name% >> %log_file_name%

)

:: ====== Wait for a while =======
ping -n 5 localhost > NUL

goto while
::****************************** End While Statement ***********************************
