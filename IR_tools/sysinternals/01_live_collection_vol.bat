:: Health Check Data Collection Script - volatile data
::
:: v1.0
::
:: Readme / Script syntax
::
:: This script will collect volatile data from a live system.
:: Syntax is as follows:
:: 01_live_collection_vol.bat [drive letter for tools and data storage] 
::
:: example: 01_live_collection_vol.bat F 
::
:: Setting variables for command-line options

set c_drive=%1

:: Create data collection directory

cls
:: Creates the directory on the collection drive to store data if it isn't already present
if not exist %c_drive%:\Data-%COMPUTERNAME% (
	echo %DATE% %TIME% - Creating output folder for %COMPUTERNAME%
	echo:
	mkdir %c_drive%:\Data-%COMPUTERNAME%
	)

:: Log creation

echo %DATE% %TIME% - Creating collection log for %COMPUTERNAME% >> %c_drive%:\Data-%COMPUTERNAME%\Collection-%COMPUTERNAME%.log	
	
:: Volatile data collection
	
mkdir %c_drive%:\Data-%COMPUTERNAME%\volatile_data	
	
%c_drive%:\IR_tools\sysinternals\tcpvcon.exe -can -accepteula >> %c_drive%:\Data-%COMPUTERNAME%\volatile_data\tcpvcon-%COMPUTERNAME%.txt
%c_drive%:\IR_tools\sysinternals\psloggedon.exe -accepteula >> %c_drive%:\Data-%COMPUTERNAME%\volatile_data\psloggedon-%COMPUTERNAME%.txt
%c_drive%:\IR_tools\sysinternals\pslist.exe -accepteula >> %c_drive%:\Data-%COMPUTERNAME%\volatile_data\pslist-%COMPUTERNAME%.txt
%c_drive%:\IR_tools\sysinternals\psfile.exe -accepteula >> %c_drive%:\Data-%COMPUTERNAME%\volatile_data\psfile-%COMPUTERNAME%.txt
%c_drive%:\IR_tools\sysinternals\psinfo.exe -d -accepteula >> %c_drive%:\Data-%COMPUTERNAME%\volatile_data\psinfo-%COMPUTERNAME%.txt
%c_drive%:\IR_tools\sysinternals\autorunsc.exe -a -c -accepteula >> %c_drive%:\Data-%COMPUTERNAME%\volatile_data\autoruns-%COMPUTERNAME%.csv
%c_drive%:\IR_tools\nirsoft\cprocess.exe /stab %c_drive%:\Data-%COMPUTERNAME%\volatile_data\cprocess-%COMPUTERNAME%.txt
%c_drive%:\IR_tools\nirsoft\cports.exe /stab %c_drive%:\Data-%COMPUTERNAME%\volatile_data\cports-%COMPUTERNAME%.txt
%c_drive%:\IR_tools\winaudit\WinAudit.exe /r=gsoPxuTUeERNtnzDaIbMpmidcSArGBL /o=HTML /f=%c_drive%:\Data-%COMPUTERNAME%\volatile_data\winaudit-%COMPUTERNAME%

echo %DATE% %TIME% - Completed acquiring volatile data of %COMPUTERNAME% >> %c_drive%:\Data-%COMPUTERNAME%\Collection-%COMPUTERNAME%.log
