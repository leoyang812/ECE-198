@echo off
setlocal
cd /d "%~dp0frontend"
where npm.cmd >nul 2>&1
if errorlevel 1 (
  echo Node.js and npm are required. Install Node.js 20.9 or newer, then reopen your terminal.
  exit /b 1
)
if not exist "node_modules\.bin\next.cmd" (
  echo Installing frontend dependencies...
  call npm.cmd ci --no-audit --no-fund
  if errorlevel 1 exit /b 1
)
call npm.cmd run dev %*
exit /b %errorlevel%
