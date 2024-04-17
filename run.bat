@echo off

:startflag

ECHO %cd%
ECHO %~dp0
ECHO ################################# 命令行路经与文件路经

::先从当前目录找到可用的jar文件,注意文件后辍.jar1没有被排除
SET jarfile=%~dp0run.jar
for %%j in (%~dp0*.jar) do (
    echo %%j
    SET jarfile=%%j
)

ECHO %jarfile% this file is choose
cd %~dp0
ECHO ################################# 显示当前选中的jar文件并切换到此bat文件目录

REM 进入到jdk*/jre/bin目录,使用start命令可以保证cmd窗口不显示,JDK不区分大小写
for /d %%i in (jdk*) do ( 
    echo %%i
    echo %%~dpi
    echo %~dp0%%i\jre\bin\javaw.exe
    if exist %~dp0%%i\jre\bin\javaw.exe (
        start %~dp0%%i\jre\bin\javaw.exe -jar %jarfile%
        exit
    ) else (
        echo javaw file not exist in jdk %%i
    )
)

REM 进入到jre*/bin目录,使用start命令可以保证cmd窗口不显示,jre不区分大小写
for /d %%i in (jre*) do ( 
    echo %%i
    echo %%~dpi
    echo %~dp0%%i\bin\javaw.exe
    if exist %~dp0%%i\bin\javaw.exe (
        start %~dp0%%i\bin\javaw.exe -jar %jarfile%
        exit
    ) else (
        echo javaw file not exist in jre %%i
    )
)

echo not find jdk or jre directory in %~dp0
echo 由于没有找到有效的jdk或jre目录，正在尝试从jre1.8.0_202目录解压(请不要改变解压路经)...
call jre8rar\jre1.8.0_202.part01.exe
echo 不要使用start命令,call命令会等待解压结束后继续执行,start则不会。

ECHO 重新从头开始执行 ...
goto startflag

pause
exit
