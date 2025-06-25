@echo off

echo ===================================================
echo Health Recommendation System - Complete Setup
echo ===================================================
echo.

echo Checking for Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH.
    echo Please install Python 3.8 or higher from https://python.org
    echo Make sure to check "Add Python to PATH" during installation.
    pause
    exit /b 1
)

echo Checking for Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed or not in PATH.
    echo Please install Node.js from https://nodejs.org
    pause
    exit /b 1
)


echo Step 1: Setting up environment variables...
if not exist ".env" (
    echo Creating .env file...
    (
        echo JWT_SECRET_KEY=your_secret_key_change_this_in_production
        echo MONGO_URI=mongodb://localhost:27017/health_app
        echo ADMIN_EMAIL=admin@example.com
        echo ADMIN_PASSWORD=admin123
        echo PORT=5000
    ) > .env
    echo .env file created successfully!
) else (
    echo .env file already exists.
)

echo.

mkdir mongodb-data 2>nul

echo.
echo Step 6: Setting up MongoDB (if available)...
where mongod >nul 2>&1
if %errorlevel% equ 0 (
    call mongodb_setup.bat
) else (
    echo MongoDB not available locally. Make sure to configure MONGO_URI in .env for cloud database.
)

echo.
echo ===================================================
echo Setup completed successfully!
echo ===================================================
echo.
echo Next steps:
echo 1. If using MongoDB Atlas, update MONGO_URI in .env file
echo 2. Run 'runner.bat' to start the application
echo 3. Access the app at http://localhost:5173
echo.
echo Default admin credentials:
echo Email: admin@example.com
echo Password: admin123
echo.
echo Press any key to exit...
pause >nul
