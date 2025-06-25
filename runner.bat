@echo off
echo ===================================================
echo Health Recommendation System - Runner Script
echo ===================================================
echo.

echo Checking if MongoDB is running...
tasklist /FI "IMAGENAME eq mongod.exe" 2>NUL | find /I /N "mongod.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo MongoDB is already running.
) else (
    echo Starting MongoDB server...
    start "MongoDB Server" /B mongod --dbpath=mongodb-data --logpath=mongodb-data\mongodb.log
    echo Waiting for MongoDB to start...
    timeout /t 5 /nobreak >nul
)

echo Starting Flask backend server...
start "Flask Backend" cmd /k "cd /d %CD% && python backend\app.py"

echo Waiting for backend to start...
timeout /t 3 /nobreak >nul

echo Starting React frontend...
start "React Frontend" cmd /k "cd /d %CD% && npm run dev"

echo ===================================================
echo All services started successfully!
echo ===================================================
echo.
echo Backend running at: http://localhost:5000
echo Frontend running at: http://localhost:5173
echo MongoDB data: mongodb-data directory
echo.