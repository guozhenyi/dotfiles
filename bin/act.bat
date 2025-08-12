@echo off

REM chcp 65001 >nul

REM 记录脚本启动时的当前目录（起始目录）
REM Record the current directory (starting directory)
set "start_dir=%cd%"

REM 取当前盘符根目录（如 D:\）
REM Get the root directory of the current driver（如 D:\）
set "root=%cd:~0,3%"

REM 从当前目录开始查找
REM Search starting from the current directory
set "dir=%cd%"

:search
if exist "%dir%\.venv\Scripts\activate.bat" (
    call "%dir%\.venv\Scripts\activate.bat"
    goto :eof
) else (
	echo venv not found: %dir%
)

if "%dir%"=="%root%" (
    choice /m "Create a new virtual environment"
    if errorlevel 2 goto :eof
    cd /d "%start_dir%"
    python -m venv .venv
    if exist ".venv\Scripts\activate.bat" (
        echo Venv created: "%start_dir%\.venv"
        call ".venv\Scripts\activate.bat"
    ) else (
        echo Failed to create virtual environment. Please check if Python is installed.
    )
    goto :eof
)

REM 继续向上一级目录
REM Continue to the parent directory
cd /d "%dir%\.."
set "dir=%cd%"
goto search
