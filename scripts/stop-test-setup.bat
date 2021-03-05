@echo off
cd ..
FOR /L %%i IN (0,1,6) DO call :kill-processes-on-port "%%i"

:kill-processes-on-port
FOR /f "tokens=5" %%p in ('netstat -aon ^| find ":854%~1" ^| find "LISTENING"') DO call :kill-process "%~1", "%%p"

:kill-process
IF NOT [%~1] EQU []	(	
	IF NOT [%~2] EQU []	(	
		echo Killing pid %~2 at port 854%~1
		taskkill /f /pid %~2	
	) ELSE (
		echo Nothing to kill at port 854%~1
	)
)