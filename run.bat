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
echo ����û���ҵ���Ч��jdk��jreĿ¼�����ڳ��Դ�jre1.8.0_202Ŀ¼��ѹ(�벻Ҫ�ı��ѹ·��)...
call jre8rar\jre1.8.0_202.part01.exe
echo ��Ҫʹ��start����,call�����ȴ���ѹ���������ִ��,start�򲻻ᡣ

ECHO ���´�ͷ��ʼִ�� ...
goto startflag

pause
exit
