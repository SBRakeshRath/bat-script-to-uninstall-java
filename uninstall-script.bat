@echo off
setlocal enabledelayedexpansion
@REM RUN AS ADMINISTRATOR
@REM --------------------------------------
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

@REM --------------------------------------

Title Java Uninstaller
echo:

echo --------------------------------------
echo:


echo Operation with
echo:
echo    J     a  v     v  a
echo    J    a a  v   v  a a
echo    J   aaaaa  v v  aaaaa
echo  JJJ  a     a  v  a     a

echo:
echo --------------------------------------
echo:









@REM --------------------------------------





rem check if the java is installed or not
@REM write code
where java >nul 2>nul
if %errorlevel%==1 (
    echo Java is not installed now safely exitng from the script
    pause
    exit
)


echo Welcome to the script to uninstall the java if it is version 8 or higher


REM Check if the java version is 8 or higher

for /f "tokens=3" %%g in ('java -version 2^>^&1 ^| findstr /i "version"') do (
    set java_version=%%g
    rem remove quotes
    set java_version=!java_version:~1,-1!
    echo "java version is !java_version!"
)




    set java_version_major=0
    @rem seperate the string into 3 piece by using the delimiter "."
    for /f "tokens=1,2,3 delims=." %%a in ("!java_version!") do (
        set java_version_major=%%b
        if %%a GTR %%b (set java_version_major=%%a)
        )

if %java_version_major% GTR 7 (
    echo "java version is 8 or higher"
    echo "uninstalling java......................"
    REM uninstall java
    wmic product where "name like '%%java%%'" call uninstall /nointeractive
) else (
    echo "java version is less than 7 so exiting from the script"
)


@REM check if  C:\Program Files\Eclipse Adoptium exists and if it does then remove it

if exist "C:\Program Files\Eclipse Adoptium" (
    echo "Eclipse Adoptium exists so removing it"
    rmdir /s /q "C:\Program Files\Eclipse Adoptium"
) else (
    echo "Eclipse Adoptium does not exist"
)







echo %java_version_major%


pause
