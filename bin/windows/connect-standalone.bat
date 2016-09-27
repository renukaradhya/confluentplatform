@echo off
rem trying connect
rem Using pushd popd to set BASE_DIR to the absolute path
SetLocal
pushd %~dp0..
set BASE_DIR=%CD%
popd

set JAVA_BASE_DIR=%BASE_DIR%/../share/java
echo %JAVA_BASE_DIR%
for %%i in (confluent-common, kafka-serde-tools, monitoring-interceptors) do (
 echo %%i
 call :concat %JAVA_BASE_DIR%/%%i/*
)
for %%i in (kafka-connect-elasticsearch) do (
 echo %%i
 call :concat %JAVA_BASE_DIR%/%%i/*
)

%~dp0kafka-run-class.bat org.apache.kafka.connect.cli.ConnectStandalone %*
EndLocal

goto :eof
:concat
IF ["%CLASSPATH%"] EQU [""] (
  set CLASSPATH="%1"
) ELSE (
  set CLASSPATH=%CLASSPATH%;"%1"
)