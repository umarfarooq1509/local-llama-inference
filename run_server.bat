@echo off
REM Script to run the Llama server with the model

set MODEL_PATH=models\Llama-3.1-8B-Instruct-Q4_K_M.gguf
set SERVER_EXE=llama.cpp\build\bin\Release\llama-server.exe

if not exist "%MODEL_PATH%" (
    echo Model file not found. Please download it first.
    pause
    exit /b 1
)

if not exist "%SERVER_EXE%" (
    echo Server executable not found. Please build llama.cpp first.
    pause
    exit /b 1
)

echo Starting Llama server...
"%SERVER_EXE%" -m "%MODEL_PATH%" --port 8080

pause