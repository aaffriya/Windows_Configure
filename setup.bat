@echo off

set "scriptver=1.0"
title Script By Bhupender Yadav

if exist X:\Windows\System32 goto :CHECKFILE
if not exist X:\Windows\System32 goto :SETADMIN

:SETADMIN
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

REG QUERY HKU\S-1-5-19\Environment >NUL 2>&1
IF %ERRORLEVEL% EQU 0 goto :CHOICE_MENU
echo ======================================================================
echo               This script needs to be Run as administrator.
echo ======================================================================
echo ======================================================================
echo          "Right click" on file and click on "Run as administrator".
echo ======================================================================
echo.
pause
goto :END 

:CHOICE_MENU
cls
set "choice="
echo.
echo        Install_Windows  Script Version-%scriptver%
echo.
echo             ************Support all Windows UEFI System and BIOS System**************
echo             ************No Need to Disable Secure Boot with this script**********
echo            ********This script bypass the Windows 11 system requirements********
echo.
echo   note**   -Please Turn off Controlled folder access if on in the Windows Security.
echo            -To use of Windows DISM.exe Bootim.exe and BCDBoot.exe Commands.
echo            -Otherwise you can allow manual without Turn off Controlled folder access.
echo            -Command line Dism.exe Bootim.exe and BCDBoot.exe (C:\Windows\sysytem32\dism.exe Bootim.exe and BCDBoot.exe)
echo.
echo.
echo       1 - Clean Install by Pen drive (Need A Pen Drive)
echo.
echo       2 - Dual Boot with a Partition. (Simple)
echo       3 - Dual Boot With a VHDX file. (Easy and Safe)
echo.
echo       4 - Quit without Installing
echo.
set /p choice="Choice: "
echo.
if /I "%choice%"=="1" goto :MAKEWINPE
if /I "%choice%"=="2" goto :DUALPARTITION
if /I "%choice%"=="3" goto :VHDX
if /I "%choice%"=="4" goto :END
echo.
goto :END

:MAKEWINPE
cls
echo                         Script Version-%scriptver%
echo ======================================================================
echo.                          
goto :FORMAT
cls
:DISKERROR
echo **Wrong Target Disk or System disk**
:FORMAT
echo list disk | diskpart
set /p Disk=Enter Pen drive Disk Number (Confirm to check Disk size):
if "%Disk%"=="" goto :DISKERROR
if "%Disk%"=="0" goto :DISKERROR
echo list disk  > diskpart.txt
echo select disk %Disk% >> diskpart.txt
echo clean >> diskpart.txt
echo create partition primary size=64 >> diskpart.txt
echo format quick fs=fat32 label="Reserved" >> diskpart.txt
echo assign letter=S >> diskpart.txt
echo active >> diskpart.txt
echo create partition primary >> diskpart.txt
echo format fs=ntfs quick label="Windows PE" >> diskpart.txt
echo assign letter=P >> diskpart.txt
echo list vol >> diskpart.txt
echo exit >> diskpart.txt
echo.
echo ======================================================================
echo                         Formatting Pen drive...
echo ======================================================================
echo CAUTION: All the data on the Removable Disk will be DELETED *.
SET /P READY=Erase all data and continue? (Y or N):
if %READY%.==y. set READY=Y
if not %READY%.==Y. goto :END
diskpart /s diskpart.txt
if %errorlevel% NEQ 0 cls & echo    **ERROR:Target wrong disk or Diskpart.exe failed. & del diskpart.txt & goto END
del diskpart.txt
echo ======================================================================
:FINDING_ISO_FILE1
cls
echo.
echo.
echo ======================================================================
echo                           CHECKING ISO FILE
echo ======================================================================
echo.
echo.
:A
if not exist A:\Sources\install.wim goto :B
set ISOpath=%vol%A:\Sources\
goto :CREATEWIM
:B
if not exist B:\Sources\install.wim goto :C
set ISOpath=%vol%B:\Sources\
goto :CREATEWIM
:C
if not exist C:\Sources\install.wim goto :D
set ISOpath=%vol%C:\Sources\
goto :CREATEWIM
:D
if not exist D:\Sources\install.wim goto :E
set ISOpath=%vol%D:\Sources\
goto :CREATEWIM
:E
if not exist E:\Sources\install.wim goto :F
set ISOpath=%vol%E:\Sources\
goto :CREATEWIM
:F
if not exist F:\Sources\install.wim goto :G
set ISOpath=%vol%F:\Sources\
goto :CREATEWIM
:G
if not exist G:\Sources\install.wim goto :H
set ISOpath=%vol%G:\Sources\
goto :CREATEWIM
:H
if not exist H:\Sources\install.wim goto :I
set ISOpath=%vol%H:\Sources\
goto :CREATEWIM
:I
if not exist I:\Sources\install.wim goto :J
set ISOpath=%vol%I:\Sources\
goto :CREATEWIM
:J
if not exist J:\Sources\install.wim goto :K
set ISOpath=%vol%J:\Sources\
goto :CREATEWIM
:K
if not exist K:\Sources\install.wim goto :L
set ISOpath=%vol%K:\Sources\
goto :CREATEWIM
:L
if not exist L:\Sources\install.wim goto :M
set ISOpath=%vol%L:\Sources\
goto :CREATEWIM
:M
if not exist M:\Sources\install.wim goto :N
set ISOpath=%vol%M:\Sources\
goto :CREATEWIM
:N
if not exist N:\Sources\install.wim goto :O
set ISOpath=%vol%N:\Sources\
goto :CREATEWIM
:O
if not exist O:\Sources\install.wim goto :P
set ISOpath=%vol%O:\Sources\
goto :CREATEWIM
:P
if not exist P:\Sources\install.wim goto :Q
set ISOpath=%vol%P:\Sources\
goto :CREATEWIM
:Q
if not exist Q:\Sources\install.wim goto :R
set ISOpath=%vol%Q:\Sources\
goto :CREATEWIM
:R
if not exist R:\Sources\install.wim goto :S
set ISOpath=%vol%R:\Sources\
goto :CREATEWIM
:S
if not exist S:\Sources\install.wim goto :T
set ISOpath=%vol%S:\Sources\
goto :CREATEWIM
:T
if not exist T:\Sources\install.wim goto :U
set ISOpath=%vol%T:\Sources\
goto :CREATEWIM
:U
if not exist U:\Sources\install.wim goto :V
set ISOpath=%vol%U:\Sources\
goto :CREATEWIM
:V
if not exist V:\Sources\install.wim goto :W
set ISOpath=%vol%V:\Sources\
goto :CREATEWIM
:W
if not exist W:\Sources\install.wim goto :X
set ISOpath=%vol%W:\Sources\
goto :CREATEWIM
:X
if not exist X:\Sources\install.wim goto :Y
set ISOpath=%vol%X:\Sources\
goto :CREATEWIM
:Y
if not exist Y:\Sources\install.wim goto :Z
set ISOpath=%vol%Y:\Sources\
goto :CREATEWIM
:Z
if not exist Z:\Sources\install.wim goto :ERRORWINPE
set ISOpath=%vol%Z:\Sources\
echo.
echo.
:ERRORWINPE
echo ======================================================================
echo                           File not Mounted.
echo ======================================================================
echo.
echo ======================================================================
echo            Go* to ISO file and select or Press Enter(Mount).
echo ======================================================================
echo.
echo                  -----Without closing this Script.-----
TIMEOUT /T 5
goto :FINDING_ISO_FILE1
:CREATEWIM
echo                           ----OK DONE----
echo                           FILE  MOUNTED
echo ======================================================================
echo                       Making WinPe File.....
echo ======================================================================
dism /export-image /SourceImageFile:%ISOpath%boot.wim /SourceIndex:1 /DestinationImageFile:"%cd%\boot.wim" /Compress:max /CheckIntegrity
if exist "%CD%\temp" rmdir /q "%cd%\temp"
if %errorlevel% NEQ 0 cls & echo **    ERROR: Run script from another loaction. & goto END
md "%CD%\temp"
Dism /Mount-WIM /WimFile:"%cd%\boot.wim" /index:1 /MountDir:"%cd%\temp"
%ISOpath%Dism.exe /image:"%cd%\temp" /Set-TargetPath:X:\
if %errorlevel% NEQ 0 Dism /image:"%cd%\temp" /Set-TargetPath:X:\
if %errorlevel% NEQ 0 cls & echo ERROR: Dism.exe failed or old vrsion. & goto END
Echo Un-mounting...
Dism /Unmount-WIM /MountDir:"%cd%\temp" /Commit
if %errorlevel% NEQ 0 cls & echo **    ERROR: dism.exe Failed, Please allow Dism.exe in Controlled folder access in Windows Security. & echo Go to notification(WIN+N) and allow Dism.exe & echo After Give access try again & goto END
dism /cleanup-wim
rmdir /q "%cd%\temp"
echo ========= Apply the image to the "Windows PE" partition =============
dism /Apply-Image /ImageFile:"%cd%\boot.wim" /Index:1 /ApplyDir:P:\
echo ============== Copy boot files to the "Windows PE" ==================
BCDboot P:\Windows /s S: /f ALL
if %errorlevel% NEQ 0 cls & del /q "%cd%\boot.wim" & echo **    ERROR:Access Denied. BCDBoot.exe or Bootim.exe failed. & echo Go to notification(WIN+N) and allow BCDBoot.exe or Bootim.exe & echo After Give access try again & goto END
echo ======================================================================
del /q "%cd%\boot.wim"
echo wpeinit > "P:\Windows\System32\startnet.cmd"
echo if not exist X:\Windows\System32\startnet.cmd if exist X:\Setup.bat xcopy "X:\Setup.bat" "X:\Windows\System32\"  >> "P:\Windows\System32\startnet.cmd"
echo if not exist X:\Windows\System32\startnet.cmd if not exist X:\Setup.bat if exist C:\Setup.bat xcopy "C:\Setup.bat" "X:\Windows\System32\" >> "P:\Windows\System32\startnet.cmd"
echo if not exist X:\Windows\System32\startnet.cmd cls >> "P:\Windows\System32\startnet.cmd"
echo if not exist X:\Windows\System32\startnet.cmd echo. >> "P:\Windows\System32\startnet.cmd"
echo if not exist X:\Windows\System32\startnet.cmd echo ====================Script is Missing================= >> "P:\Windows\System32\startnet.cmd"
echo if not exist X:\Windows\System32\startnet.cmd goto :END  >> "P:\Windows\System32\startnet.cmd"
echo call setup.bat >> "P:\Windows\System32\startnet.cmd"
echo :END >> "P:\Windows\System32\startnet.cmd"
xcopy "%cd%\Setup.bat" "P:\Windows\System32\"
xcopy "%cd%\Setup.bat" "P:\"
xcopy "%cd%\Setup.bat" "S:\"
echo ======================================================================
echo                Coping file in USB drive...Please wait
echo ======================================================================
if not exist P:\Sources md "P:\Sources"
xcopy "%ISOpath%install.wim" "P:\Sources"
cls
echo ======================================================================
echo                     Script Version-%scriptver%
echo.
echo                        Pen drive is Ready!
echo           Just Plug and Install Windows Automatically
echo ======================================================================
echo                      Boot key for Motherbords
echo         GIGABYTE=DEL    ASUS=DEL,F10     ASRock=F2     MSI=DEL                
echo ======================================================================
echo                         Type Exit to Close
goto :END
echo ======================================================================

:DUALPARTITION

:FINDING_ISO_FILE2
cls
echo                         Script Version-%scriptver%
echo.
echo.
echo ======================================================================
echo                             CHECKING ISO FILE
echo ======================================================================
echo.
echo.
:A
if not exist A:\Sources\install.wim goto :B
set ISOpath=%vol%A:\Sources\
goto :PARTDEPLOY
:B
if not exist B:\Sources\install.wim goto :C
set ISOpath=%vol%B:\Sources\
goto :PARTDEPLOY
:C
if not exist C:\Sources\install.wim goto :D
set ISOpath=%vol%C:\Sources\
goto :CREATEWIM
:D
if not exist D:\Sources\install.wim goto :E
set ISOpath=%vol%D:\Sources\
goto :PARTDEPLOY
:E
if not exist E:\Sources\install.wim goto :F
set ISOpath=%vol%E:\Sources\
goto :PARTDEPLOY
:F
if not exist F:\Sources\install.wim goto :G
set ISOpath=%vol%F:\Sources\
goto :PARTDEPLOY
:G
if not exist G:\Sources\install.wim goto :H
set ISOpath=%vol%G:\Sources\
goto :PARTDEPLOY
:H
if not exist H:\Sources\install.wim goto :I
set ISOpath=%vol%H:\Sources\
goto :PARTDEPLOY
:I
if not exist I:\Sources\install.wim goto :J
set ISOpath=%vol%I:\Sources\
goto :PARTDEPLOY
:J
if not exist J:\Sources\install.wim goto :K
set ISOpath=%vol%J:\Sources\
goto :PARTDEPLOY
:K
if not exist K:\Sources\install.wim goto :L
set ISOpath=%vol%K:\Sources\
goto :PARTDEPLOY
:L
if not exist L:\Sources\install.wim goto :M
set ISOpath=%vol%L:\Sources\
goto :PARTDEPLOY
:M
if not exist M:\Sources\install.wim goto :N
set ISOpath=%vol%M:\Sources\
goto :PARTDEPLOY
:N
if not exist N:\Sources\install.wim goto :O
set ISOpath=%vol%N:\Sources\
goto :PARTDEPLOY
:O
if not exist O:\Sources\install.wim goto :P
set ISOpath=%vol%O:\Sources\
goto :PARTDEPLOY
:P
if not exist P:\Sources\install.wim goto :Q
set ISOpath=%vol%P:\Sources\
goto :PARTDEPLOY
:Q
if not exist Q:\Sources\install.wim goto :R
set ISOpath=%vol%Q:\Sources\
goto :PARTDEPLOY
:R
if not exist R:\Sources\install.wim goto :S
set ISOpath=%vol%R:\Sources\
goto :PARTDEPLOY
:S
if not exist S:\Sources\install.wim goto :T
set ISOpath=%vol%S:\Sources\
goto :PARTDEPLOY
:T
if not exist T:\Sources\install.wim goto :U
set ISOpath=%vol%T:\Sources\
goto :PARTDEPLOY
:U
if not exist U:\Sources\install.wim goto :V
set ISOpath=%vol%U:\Sources\
goto :PARTDEPLOY
:V
if not exist V:\Sources\install.wim goto :W
set ISOpath=%vol%V:\Sources\
goto :PARTDEPLOY
:W
if not exist W:\Sources\install.wim goto :X
set ISOpath=%vol%W:\Sources\
goto :PARTDEPLOY
:X
if not exist X:\Sources\install.wim goto :Y
set ISOpath=%vol%X:\Sources\
goto :PARTDEPLOY
:Y
if not exist Y:\Sources\install.wim goto :Z
set ISOpath=%vol%Y:\Sources\
goto :PARTDEPLOY
:Z
if not exist Z:\Sources\install.wim goto :ERRORPART
set ISOpath=%vol%Z:\Sources\
echo.
echo.
:ERRORPART
echo ======================================================================
echo                         File not Mounted.
echo ======================================================================
echo.
echo ======================================================================
echo          Go* to ISO file and select or Press Enter(Mount).
echo ======================================================================
echo.
echo                                      -----Without closing this Script.-----
TIMEOUT /T 5
goto :FINDING_ISO_FILE2
:PARTDEPLOY
cls
echo                            ----OK DONE----
echo                            FILE  MOUNTED
echo ======================================================================
echo.
dism /Get-WimInfo /WimFile:"%ISOpath%install.wim"
set /p Index=Enter Index Number (Windows Edition) :
if "%index%"=="" goto :END
cls
echo list vol | diskpart
set /p Volume=Enter Volume Letter :
if "%Volume%"=="" goto :END
if "%Volume%"=="C" goto :END
dism /Apply-Image /ImageFile:"%ISOpath%install.wim" /Index:%index% /ApplyDir:%Volume%:\
if %errorlevel% NEQ 0 cls & echo **    ERROR: dism.exe Failed, Please allow Dism.exe in Controlled folder access in Windows Security. & echo Go to notification(WIN+N) and allow Dism.exe & echo After Give access try again & goto END
bcdboot %Volume%:\Windows
if %errorlevel% NEQ 0 cls & echo **    ERROR:Access Denied. BCDBoot.exe or Bootim.exe failed. & echo Go to notification(WIN+N) and allow BCDBoot.exe or Bootim.exe & echo After Give access try again & goto END
goto :END

:VHDX

:FINDING_ISO_FILE3
cls
echo                      Script Version-%scriptver%
echo.
echo.
echo ======================================================================
echo                         CHECKING ISO FILE
echo ======================================================================
echo.
echo.
:A
if not exist A:\Sources\install.wim goto :B
set ISOpath=%vol%A:\Sources\
goto :CREATEVHDX
:B
if not exist B:\Sources\install.wim goto :C
set ISOpath=%vol%B:\Sources\
goto :CREATEVHDX
:C
if not exist C:\Sources\install.wim goto :D
set ISOpath=%vol%C:\Sources\
goto :CREATEVHDX
:D
if not exist D:\Sources\install.wim goto :E
set ISOpath=%vol%D:\Sources\
goto :CREATEVHDX
:E
if not exist E:\Sources\install.wim goto :F
set ISOpath=%vol%E:\Sources\
goto :CREATEVHDX
:F
if not exist F:\Sources\install.wim goto :G
set ISOpath=%vol%F:\Sources\
goto :CREATEVHDX
:G
if not exist G:\Sources\install.wim goto :H
set ISOpath=%vol%G:\Sources\
goto :CREATEVHDX
:H
if not exist H:\Sources\install.wim goto :I
set ISOpath=%vol%H:\Sources\
goto :CREATEVHDX
:I
if not exist I:\Sources\install.wim goto :J
set ISOpath=%vol%I:\Sources\
goto :CREATEVHDX
:J
if not exist J:\Sources\install.wim goto :K
set ISOpath=%vol%J:\Sources\
goto :CREATEVHDX
:K
if not exist K:\Sources\install.wim goto :L
set ISOpath=%vol%K:\Sources\
goto :CREATEVHDX
:L
if not exist L:\Sources\install.wim goto :M
set ISOpath=%vol%L:\Sources\
goto :CREATEVHDX
:M
if not exist M:\Sources\install.wim goto :N
set ISOpath=%vol%M:\Sources\
goto :CREATEVHDX
:N
if not exist N:\Sources\install.wim goto :O
set ISOpath=%vol%N:\Sources\
goto :CREATEVHDX
:O
if not exist O:\Sources\install.wim goto :P
set ISOpath=%vol%O:\Sources\
goto :CREATEVHDX
:P
if not exist P:\Sources\install.wim goto :Q
set ISOpath=%vol%P:\Sources\
goto :CREATEVHDX
:Q
if not exist Q:\Sources\install.wim goto :R
set ISOpath=%vol%Q:\Sources\
goto :CREATEVHDX
:R
if not exist R:\Sources\install.wim goto :S
set ISOpath=%vol%R:\Sources\
goto :CREATEVHDX
:S
if not exist S:\Sources\install.wim goto :T
set ISOpath=%vol%S:\Sources\
goto :CREATEVHDX
:T
if not exist T:\Sources\install.wim goto :U
set ISOpath=%vol%T:\Sources\
goto :CREATEVHDX
:U
if not exist U:\Sources\install.wim goto :V
set ISOpath=%vol%U:\Sources\
goto :CREATEVHDX
:V
if not exist V:\Sources\install.wim goto :W
set ISOpath=%vol%V:\Sources\
goto :CREATEVHDX
:W
if not exist W:\Sources\install.wim goto :X
set ISOpath=%vol%W:\Sources\
goto :CREATEVHDX
:X
if not exist X:\Sources\install.wim goto :Y
set ISOpath=%vol%X:\Sources\
goto :CREATEVHDX
:Y
if not exist Y:\Sources\install.wim goto :Z
set ISOpath=%vol%Y:\Sources\
goto :CREATEVHDX
:Z
if not exist Z:\Sources\install.wim goto :ERRORVHDX
set ISOpath=%vol%Z:\Sources\
echo.
echo.
:ERRORVHDX
echo ======================================================================
echo                           File not Mounted.
echo ======================================================================
echo.
echo ======================================================================
echo            Go* to ISO file and select or Press Enter(Mount).
echo ======================================================================
echo.
echo                -----Without closing this Script.-----
TIMEOUT /T 5
goto :FINDING_ISO_FILE3
echo                         ----OK DONE----
echo                         FILE  MOUNTED
echo ======================================================================
:CREATEVHDX
cls
echo list vol | diskpart
set /p Volume=Enter Volume Letter:
if "%Volume%"=="" goto :END
if "%Volume%"=="C" goto :END
echo create vdisk file=%Volume%:\WindowsVHDX.vhdx maximum=25600 type=fixed > Createvhdx.txt
echo attach vdisk  >> Createvhdx.txt
echo create partition primary  >> Createvhdx.txt
echo format quick label=Windows  >> Createvhdx.txt
echo assign letter=v  >> Createvhdx.txt
echo exit  >> Createvhdx.txt
diskpart /s Createvhdx.txt
if %errorlevel% NEQ 0 cls & echo    **ERROR:Can't creating VHDX file or Diskpart.exe failed. & del Createvhdx.txt & goto END
del Createvhdx.txt
echo ======================================================================
cls
dism /Get-WimInfo /WimFile:"%ISOpath%install.wim"
set /p Index=Enter Index Number (Windows Edition) :
if "%index%"=="" goto :END
dism /Apply-Image /ImageFile:"%ISOpath%install.wim" /Index:%index% /ApplyDir:V:\
if %errorlevel% NEQ 0 cls & echo **    ERROR: dism.exe Failed, Please allow Dism.exe in Controlled folder access in Windows Security. & echo Go to notification(WIN+N) and allow Dism.exe & echo After Give access try again & goto END
bcdboot V:\Windows
if %errorlevel% NEQ 0 cls & echo **    ERROR:Access Denied. BCDBoot.exe or Bootim.exe failed. & echo Go to notification(WIN+N) and allow BCDBoot.exe or Bootim.exe & echo After Give access try again & goto END
goto :END

:CHECKFILE

cls
:A
if not exist A:\Sources\install.wim goto :B
set WIMINSOURCES=%vol%A:\Sources\
goto :INSTALL
:B
if not exist B:\Sources\install.wim goto :C
set WIMINSOURCES=%vol%B:\Sources\
goto :INSTALL
:C
if not exist C:\Sources\install.wim goto :D
set WIMINSOURCES=%vol%C:\Sources\
goto :INSTALL
:D
if not exist D:\Sources\install.wim goto :E
set WIMINSOURCES=%vol%D:\Sources\
goto :INSTALL
:E
if not exist E:\Sources\install.wim goto :F
set WIMINSOURCES=%vol%E:\Sources\
goto :INSTALL
:F
if not exist F:\Sources\install.wim goto :G
set WIMINSOURCES=%vol%F:\Sources\
goto :INSTALL
:G
if not exist G:\Sources\install.wim goto :H
set WIMINSOURCES=%vol%G:\Sources\
goto :INSTALL
:H
if not exist H:\Sources\install.wim goto :I
set WIMINSOURCES=%vol%H:\Sources\
goto :INSTALL
:I
if not exist I:\Sources\install.wim goto :J
set WIMINSOURCES=%vol%I:\Sources\
goto :INSTALL
:J
if not exist J:\Sources\install.wim goto :K
set WIMINSOURCES=%vol%J:\Sources\
goto :INSTALL
:K
if not exist K:\Sources\install.wim goto :L
set WIMINSOURCES=%vol%K:\Sources\
goto :INSTALL
:L
if not exist L:\Sources\install.wim goto :M
set WIMINSOURCES=%vol%L:\Sources\
goto :INSTALL
:M
if not exist M:\Sources\install.wim goto :N
set WIMINSOURCES=%vol%M:\Sources\
goto :INSTALL
:N
if not exist N:\Sources\install.wim goto :O
set WIMINSOURCES=%vol%N:\Sources\
goto :INSTALL
:O
if not exist O:\Sources\install.wim goto :P
set WIMINSOURCES=%vol%O:\Sources\
goto :INSTALL
:P
if not exist P:\Sources\install.wim goto :Q
set WIMINSOURCES=%vol%P:\Sources\
goto :INSTALL
:Q
if not exist Q:\Sources\install.wim goto :R
set WIMINSOURCES=%vol%Q:\Sources\
goto :INSTALL
:R
if not exist R:\Sources\install.wim goto :S
set WIMINSOURCES=%vol%R:\Sources\
goto :INSTALL
:S
if not exist S:\Sources\install.wim goto :T
set WIMINSOURCES=%vol%S:\Sources\
goto :INSTALL
:T
if not exist T:\Sources\install.wim goto :U
set WIMINSOURCES=%vol%T:\Sources\
goto :INSTALL
:U
if not exist U:\Sources\install.wim goto :V
set WIMINSOURCES=%vol%U:\Sources\
goto :INSTALL
:V
if not exist V:\Sources\install.wim goto :W
set WIMINSOURCES=%vol%V:\Sources\
goto :INSTALL
:W
if not exist W:\Sources\install.wim goto :X
set WIMINSOURCES=%vol%W:\Sources\
goto :INSTALL
:X
if not exist X:\Sources\install.wim goto :Y
set WIMINSOURCES=%vol%X:\Sources\
goto :INSTALL
:Y
if not exist Y:\Sources\install.wim goto :Z
set WIMINSOURCES=%vol%Y:\Sources\
goto :INSTALL
:Z
if not exist Z:\Sources\install.wim goto :AA
set WIMINSOURCES=%vol%Z:\Sources\
echo.
:AA
if not exist A:\install.wim goto :BB
set WIMINROT=%vol%A:\
goto :INSTALL
:BB
if not exist B:\install.wim goto :CC
set WIMINROT=%vol%B:\
goto :INSTALL
:CC
if not exist C:\install.wim goto :DD
set WIMINROT=%vol%C:\
goto :INSTALL
:DD
if not exist D:\install.wim goto :EE
set WIMINROT=%vol%D:\
goto :INSTALL
:EE
if not exist E:\install.wim goto :FF
set WIMINROT=%vol%E:\
goto :INSTALL
:FF
if not exist F:\install.wim goto :GG
set WIMINROT=%vol%F:\
goto :INSTALL
:GG
if not exist G:\install.wim goto :HH
set WIMINROT=%vol%G:\
goto :INSTALL
:HH
if not exist H:\install.wim goto :II
set WIMINROT=%vol%H:\
goto :INSTALL
:II
if not exist I:\install.wim goto :JJ
set WIMINROT=%vol%I:\
goto :INSTALL
:JJ
if not exist J:\install.wim goto :KK
set WIMINROT=%vol%J:\
goto :INSTALL
:KK
if not exist K:\install.wim goto :LL
set WIMINROT=%vol%K:\
goto :INSTALL
:LL
if not exist L:\install.wim goto :MM
set WIMINROT=%vol%L:\
goto :INSTALL
:MM
if not exist M:\install.wim goto :NN
set WIMINROT=%vol%M:\
goto :INSTALL
:NN
if not exist N:\install.wim goto :OO
set WIMINROT=%vol%N:\
goto :INSTALL
:OO
if not exist O:\install.wim goto :PP
set WIMINROT=%vol%O:\
goto :INSTALL
:PP
if not exist P:\install.wim goto :QQ
set WIMINROT=%vol%P:\
goto :INSTALL
:QQ
if not exist Q:\install.wim goto :RR
set WIMINROT=%vol%Q:\
goto :INSTALL
:RR
if not exist R:\install.wim goto :SS
set WIMINROT=%vol%R:\
goto :INSTALL
:SS
if not exist S:\install.wim goto :TT
set WIMINROT=%vol%S:\
goto :INSTALL
:TT
if not exist T:\install.wim goto :UU
set WIMINROT=%vol%T:\
goto :INSTALL
:UU
if not exist U:\install.wim goto :VV
set WIMINROT=%vol%U:\
goto :INSTALL
:VV
if not exist V:\install.wim goto :WW
set WIMINROT=%vol%V:\
goto :INSTALL
:WW
if not exist W:\install.wim goto :XX
set WIMINROT=%vol%W:\
goto :INSTALL
:XX
if not exist X:\install.wim goto :YY
set WIMINROT=%vol%X:\
goto :INSTALL
:YY
if not exist Y:\install.wim goto :ZZ
set WIMINROT=%vol%Y:\
goto :INSTALL
:ZZ
if not exist Z:\install.wim goto :ERRORX
set WIMINROT=%vol%Z:\
:ERRORX
cls
echo ====================================================================================
echo                     Script Version-%scriptver%
echo ERROR: install.wim file is missing. Please copy Install.wim file in Image Partition.
echo ====================================================================================
goto :END
:INSTALL
cls
echo ======================================================================
echo                      Script Version-%scriptver%
echo ======================================================================
echo                       Starting WIM Deployment
echo ======================================================================
echo Checking to see if the PC is booted in BIOS or UEFI mode.
wpeutil UpdateBootInfo
for /f "tokens=2* delims=	 " %%A in ('reg query HKLM\System\CurrentControlSet\Control /v PEFirmwareType') DO SET Firmware=%%B
if %Firmware%==0x1 echo The PC is booted in BIOS mode. 
if %Firmware%==0x2 echo The PC is booted in UEFI mode.
if %Firmware%==0x1 echo    ...using BIOS (MBR) format and partitions.
if %Firmware%==0x2 echo    ...using UEFI (GPT) format and partitions.
echo ======================================================================
:REENTER
echo ======================================================================
echo                     Wait for loading disks...
echo ======================================================================
echo list disk | diskpart
set /p Disk=Enter Disk Number For Install Windows(Always Disk 0 Target):
if "%Disk%"=="" goto :REENTER
echo CAUTION: All the data on the disk will be DELETED *(Disk %Disk%).
SET /P READY=Erase all selected disk data and continue? (Y or N):
if %READY%.==y. set READY=Y
if not %READY%.==Y. goto :END
echo ======================================================================
if %Firmware%.==0x1. goto :MBR
if %Firmware%.==0x2. goto :GPT
if x%Firmware%==x. echo System not detect your firmware, Please choose manually
if x%Firmware%==x. echo BIOS for Y or UEFI for N
if x%Firmware%==x. SET /P SET_MANUAL_BIOS=(Y or N):
if %SET_MANUAL_BIOS%.==y. set SET_MANUAL_BIOS=Y
if x%Firmware%==x. if %SET_MANUAL_BIOS%.==Y. goto :MBR
if x%Firmware%==x. if not %SET_MANUAL_BIOS%.==Y. goto :GPT
:MBR
echo select disk %Disk% > MBR.txt
echo clean >> MBR.txt
echo convert mbr >> MBR.txt
echo create partition primary size=100 >> MBR.txt
echo format quick fs=ntfs label="System" >> MBR.txt
echo assign letter="S" >> MBR.txt
echo active >> MBR.txt
echo create partition primary size=70000  >> MBR.txt
echo format quick fs=ntfs label="Windows" >> MBR.txt
echo assign letter="W" >> MBR.txt
echo create partition primary size=1000 >> MBR.txt
echo format quick fs=ntfs label="Recovery" >> MBR.txt
echo assign letter="R" >> MBR.txt
echo set id=27 >> MBR.txt
echo create partition primary  >> MBR.txt >> MBR.txt
echo format quick fs=ntfs label="Personal" >> MBR.txt
echo list volume >> MBR.txt
echo exit >> MBR.txt
diskpart /s MBR.txt
if %errorlevel% NEQ 0 cls & echo    **ERROR:Target wrong disk or Diskpart.exe failed. & del MBR.txt & goto END
del MBR.txt
goto :DISM
:GPT
echo select disk %Disk% >> GPT.txt
echo clean >> GPT.txt
echo convert gpt >> GPT.txt
echo create partition efi size=100 >> GPT.txt
echo rem    ** NOTE: For Advanced Format 4Kn drives, >> GPT.txt
echo rem               change this value to size = 260 ** default=100 >> GPT.txt
echo format quick fs=fat32 label="System" >> GPT.txt
echo assign letter="S" >> GPT.txt
echo create partition msr size=128 >> GPT.txt
echo create partition primary size=100000 >> GPT.txt
echo format quick fs=ntfs label="Windows" >> GPT.txt
echo assign letter="W" >> GPT.txt
echo create partition primary size=1000 >> GPT.txt
echo format quick fs=ntfs label="Recovery" >> GPT.txt
echo assign letter="R" >> GPT.txt
echo set id="de94bba4-06d1-4d40-a16a-bfd50179d6ac" >> GPT.txt
echo gpt attributes=0x8000000000000001 >> GPT.txt
echo create partition primary >> GPT.txt
echo format quick fs=ntfs label="Personal" >> GPT.txt
echo list volume >> GPT.txt
echo exit >> GPT.txt
diskpart /s GPT.txt
if %errorlevel% NEQ 0 cls & echo    **ERROR:Target wrong disk or Diskpart.exe failed. & del GPT.txt & goto END
del GPT.txt
goto :DISM
:DISM
cls

echo       == Apply the image to the Windows partition ==
echo.
if exist %WIMINSOURCES% goto :DSOURCES
:DSOURCES
dism /Get-WimInfo /WimFile:"%WIMINSOURCES%\install.wim"
set /p Index=Enter Index Number (Windows Edition) :
if "%index%"=="" goto :END
echo ======================================================================
echo.
echo        ******Wait about 15 Minutes to install Windows********
echo.
echo ======================================================================
dism /apply-image /imagefile:%WIMINSOURCES%\install.wim /Index:%index% /applydir:W:\
if %errorlevel% NEQ 0 cls & echo **    ERROR:Dism.exe Failed  & echo After Give access try again & goto END
goto :COPYBOOT
if exist %WIMINROT% goto :DWITHOUTSOURCES
:DWITHOUTSOURCES
dism /Get-WimInfo /WimFile:"%WIMINROT%\install.wim"
set /p Index=Enter Index Number (Windows Edition) :
if "%index%"=="" goto :END
echo ======================================================================
echo.
echo        ******Wait about 15 Minutes to install Windows********
echo.
echo ======================================================================
dism /apply-image /imagefile:%WIMINROT%\install.wim /Index:%index% /applydir:W:\
if %errorlevel% NEQ 0 cls & echo **    ERROR:Dism.exe Failed  & echo After Give access try again & goto END
goto :COPYBOOT
echo ======================================================================
:COPYBOOT
echo           == Copy boot files to the System partition ==
if %Firmware%==0x1 W:\Windows\System32\bcdboot W:\Windows /s S: /f BIOS
if %Firmware%==0x2 W:\Windows\System32\bcdboot W:\Windows /s S: /f UEFI
if %errorlevel% NEQ 0 cls & echo **Failed to set boot information & goto END 
echo ======================================================================
echo   == Copy the Windows RE image to the Windows RE Tools partition ==
md R:\Recovery\WindowsRE
xcopy /h W:\Windows\System32\Recovery\Winre.wim R:\Recovery\WindowsRE\
echo ======================================================================
echo         == Register the location of the recovery tools ==
W:\Windows\System32\Reagentc /Setreimage /Path R:\Recovery\WindowsRE /Target W:\Windows
echo ======================================================================
echo ======================================================================
echo.
echo                   Script Version-%scriptver%
echo.
echo ***All done!
echo ***Disconnect the USB drive from the reference device.
echo ***Type exit to reboot.
goto :END
:END
