:: Health Check Data Collection Script - drive image
::
:: v1.0
::
:: Readme / Script syntax
::
:: This script will collect volatile data, memory image, and a drive image of a live system.
:: Syntax is as follows:
:: 03_live_collection_drive.bat [drive letter for tools and data storage] [physical drive #]
::
:: example: 03_live_collection_drive.bat F 0
::
:: NOTE: In order to obtain the drive # of the source drive, run the following command using ftkimager.exe:
::
:: ftkimager.exe --list-drives
::
:: Setting variables for command-line options

set c_drive=%1
set drive=%2

:: Forensic imaging

mkdir %c_drive%:\Data-%COMPUTERNAME%\drive_image

%c_drive%:\IR_tools\IR_tools\ftkimager\ftkimager.exe \\.\PHYSICALDRIVE%drive% %c_drive%:\Data-%COMPUTERNAME%\drive_image\drive%drive%-%COMPUTERNAME% --e01 --frag 2G --compress 6 --case-number TBD --evidence-number %COMPUTERNAME%_drive%drive%_001 --description %COMPUTERNAME%_drive%drive% --examiner TBD

echo %DATE% %TIME% - Completed acquiring forensic image of %COMPUTERNAME% drive %drive% >> %c_drive%:\Data-%COMPUTERNAME%\Collection-%COMPUTERNAME%.log

:: Exit data collection

echo Completed acquiring %COMPUTERNAME%'s data
pause
cls
echo %DATE% %TIME% - Exiting collection script and stopping logging for computer %COMPUTERNAME% >> %c_drive%:\Data-%COMPUTERNAME%\Collection-%COMPUTERNAME%.log