@echo off
echo ===================================================
echo MongoDB Setup Script
echo ===================================================
echo.

echo Creating MongoDB data directory...
mkdir mongodb-data 2>nul

echo Starting MongoDB server...
start "MongoDB Server" /B mongod --dbpath=mongodb-data --logpath=mongodb-data\mongodb.log

echo Waiting for MongoDB to be ready...
timeout /t 5 /nobreak >nul

:waitloop
echo Checking MongoDB connection...
mongosh --eval "db.adminCommand('ping')" --quiet >nul 2>&1
if errorlevel 1 (
    echo MongoDB not ready yet, waiting...
    timeout /t 2 /nobreak >nul
    goto waitloop
)

echo MongoDB is ready!
echo.

echo Creating health_app database and collections...
mongosh --eval "use health_app; db.createCollection('users'); db.users.createIndex({email: 1}, {unique: true}); print('MongoDB setup completed successfully!');"

echo ===================================================
echo MongoDB setup completed!
echo ===================================================
echo.
echo Database: health_app
echo Collections: users (with unique email index)
echo Data directory: mongodb-data
echo Log file: mongodb-data\mongodb.log
echo.
echo You can now run the application using runner.bat
echo.
echo Press any key to exit...
pause >nul
