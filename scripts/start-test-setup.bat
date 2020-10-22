@echo off
cd ..
echo "%~1" | FindStr /R "*openethereum*"
IF %ERRORLEVEL% EQU 0 ( 
	SET extension=openethereum.toml
) ELSE (
	SET extension=nethermind.json
)
FOR /L %%i IN (0,1,6) DO call :start-proces "%~1", "%%i", "%extension%"

:start-proces
IF NOT [%~2] EQU []	(	
	START /B %~1 --config ".\config\node%~2.%~3" > ".\data\node%~2\log" 2>&1
	node ./scripts/getReservedPeer.js "%~2"
)