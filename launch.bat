@echo off
title Droice Labs — Background Check Agent
cd /d "%~dp0"

echo.
echo  ================================================
echo   Droice Labs  ^|  Background Check Agent
echo  ================================================
echo.

:: Check that Claude Code is installed
where claude >nul 2>&1
if %errorlevel% neq 0 (
    echo  ERROR: Claude Code is not installed.
    echo.
    echo  Ask your IT administrator to run:
    echo    npm install -g @anthropic-ai/claude-code
    echo.
    pause
    exit /b 1
)

:: Pull latest agent updates from GitHub
echo  Checking for updates...
git pull --quiet 2>nul
if %errorlevel% neq 0 (
    echo  Could not check for updates ^(no internet or git not installed^).
    echo  Continuing with current version...
)
echo.

:: Launch
echo  Ready. Type your request below.
echo.
echo  Examples:
echo    "Run a background check on Jane Smith, CMO at BioData Corp"
echo    "Meeting with Dr. Lee from Pfizer on Friday - background check please"
echo    "Background checks on everyone in this list: ..."
echo.
echo  ------------------------------------------------
echo.
claude
