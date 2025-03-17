@echo off
set /p Comando=Digite o comando que deseja executar:
powershell -ExecutionPolicy Bypass -File scripts\executar-comando.ps1 -Comando "%Comando%"
pause
