:: Health Check Data Collection Script - RAM imaging
::
:: v1.0
::
:: Readme / Script syntax
::
:: This script will collect a memory image of a live system.
:: Syntax is as follows:
:: 02_live_collection_ram.bat [drive letter for tools and data storage] 
::
:: example: 02_live_collection_ram.bat F
::
:: Setting variables for command-line options

set c_drive=%1

:: Memory imaging

mkdir %c_drive%:\Data-%COMPUTERNAME%\mem_image

%c_drive%:\IR_tools\IR_tools\winpmem\winpmem_1.4.exe %c_drive%:\Data-%COMPUTERNAME%\mem_image\mem-%COMPUTERNAME%.bin

echo %DATE% %TIME% - Completed acquiring memory image of %COMPUTERNAME% >> %c_drive%:\Data-%COMPUTERNAME%\Collection-%COMPUTERNAME%.log
