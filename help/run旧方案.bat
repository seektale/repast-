@echo off

:startflag

ECHO %cd%
ECHO %~dp0
ECHO ################################# ������·�����ļ�·��

::�ȴӵ�ǰĿ¼�ҵ����õ�jar�ļ�,ע���ļ����.jar1û�б��ų�
SET jarfile=%~dp0run.jar
for %%j in (%~dp0*.jar) do (
    echo %%j
    SET jarfile=%%j
)

ECHO %jarfile% this file is choose
cd %~dp0
ECHO ################################# ��ʾ��ǰѡ�е�jar�ļ����л�����bat�ļ�Ŀ¼

REM ���뵽jdk*/jre/binĿ¼,ʹ��start������Ա�֤cmd���ڲ���ʾ,JDK�����ִ�Сд
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

REM ���뵽jre*/binĿ¼,ʹ��start������Ա�֤cmd���ڲ���ʾ,jre�����ִ�Сд
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

echo ����û���ҵ�jdk��jreĿ¼�����ڳ���Ѱ�Ҵ��ڵ�ѹ�� jre �ļ�����ѹ...
for %%j in (%~dp0jre*.tar.gz) do (
    echo %%j
    tar -zxvf %%j -C %~dp0
    goto startflag
)
echo ����û���ҵ�jdk��jreĿ¼�����ڳ���Ѱ�Ҵ��ڵ�ѹ�� jdk �ļ�����ѹ...
for %%j in (%~dp0jdk*.tar.gz) do (
    echo %%j
    tar -zxvf %%j -C %~dp0
    goto startflag
)
echo ����û���ҵ�jdk��jreĿ¼�����ڳ���Ѱ�Ҵ��ڵ�ѹ�� server-jre �ļ�����ѹ...
for %%j in (%~dp0server-jre*.tar.gz) do (
    echo %%j
    tar -zxvf %%j -C %~dp0
    goto startflag
)

ECHO ����û���ڵ�ǰĿ¼���ҵ� jdk �� jre ���Զ������������� ...
bitsadmin /transfer JvmDownLoad /download /priority normal "https://mirrors.sdwu.edu.cn/java/jre-8u202-windows-i586.tar.gz" %~dp0jre-8u202-windows-i586.tar.gz
REM û�гɹ�������certutil -urlcache -split -f  https://mirrors.sdwu.edu.cn/java/jre-8u202-windows-i586.tar.gz

ECHO ���Խ�ѹ���ص��ļ� ...
tar -zxvf jre-8u202-windows-i586.tar.gz -C %~dp0

ECHO ���´�ͷ��ʼִ�� ...
goto startflag

pause
exit
