@echo off
setlocal enabledelayedexpansion
@REM RUN AS ADMINISTRATOR
@REM --------------------------------------
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

@REM --------------------------------------

Title Java 7 install
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


@REM download the java 7 from the drive link https://drive.usercontent.google.com/download?id=1LddTpyyp0nj7UPiaZ4dLby9R2b3bx3ZX&export=download&authuser=0&confirm=t&uuid=d362cf13-fda3-44d6-a8b1-4cf15d239a88&at=AN_67v06V2gE3q6P9dhfX7OkCo3B%3A1728505089192

@REM set download link to variable download_link


@REM set the download path to variable download_path to download the java 7 to directory ./java7

set download_path="./jdk-7u80-windows-x64.exe"

@REM Download the java 7 from the download link to the download path

echo Downloading java 7 please wait patiently as it is a large file

powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://storage.googleapis.com/online-video-downloader-410712.appspot.com/jdk-7u80-windows-x64.exe', '%download_path%')"

echo Download completed 

echo Initiating the installation of java 7

@REM Install the java 7 from the download path silently

start  /wait jdk-7u80-windows-x64.exe /s

echo Installation completed

echo Cleaning up the downloaded file

del jdk-7u80-windows-x64.exe

echo Cleanup completed


echo setting the java 7 as the default java version

@REM set the java 7 as the default java version

setx JAVA_HOME "C:\Program Files\Java\jdk1.7.0_80" /m 

echo Java 7 is set as the default java version

echo adding java to environment variables

@REM add the java 7 to the environment variables

setx PATH "%PATH%;C:\Program Files\Java\jdk1.7.0_80\bin" /m

echo Java 7 is added to the environment variables

echo Java 7 is successfully installed

pause

exit











