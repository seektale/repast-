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

echo 由于没有找到jdk或jre目录，正在尝试寻找存在的压缩 jre 文件并解压...
for %%j in (%~dp0jre*.tar.gz) do (
    echo %%j
    tar -zxvf %%j -C %~dp0
    goto startflag
)
echo 由于没有找到jdk或jre目录，正在尝试寻找存在的压缩 jdk 文件并解压...
for %%j in (%~dp0jdk*.tar.gz) do (
    echo %%j
    tar -zxvf %%j -C %~dp0
    goto startflag
)
echo 由于没有找到jdk或jre目录，正在尝试寻找存在的压缩 server-jre 文件并解压...
for %%j in (%~dp0server-jre*.tar.gz) do (
    echo %%j
    tar -zxvf %%j -C %~dp0
    goto startflag
)

ECHO 由于没有在当前目录中找到 jdk 或 jre 将自动从网络中下载 ...
bitsadmin /transfer JvmDownLoad /download /priority normal "https://mirrors.sdwu.edu.cn/java/jre-8u202-windows-i586.tar.gz" %~dp0jre-8u202-windows-i586.tar.gz
REM 没有成功的命令certutil -urlcache -split -f  https://mirrors.sdwu.edu.cn/java/jre-8u202-windows-i586.tar.gz

ECHO 尝试解压下载的文件 ...
tar -zxvf jre-8u202-windows-i586.tar.gz -C %~dp0

ECHO 重新从头开始执行 ...
goto startflag

pause
exit
