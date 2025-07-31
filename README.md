# Health Recommendation System

This repository contains a Health Recommendation System that provides personalized diet and exercise recommendations. It features a React-based frontend, a Flask-based backend, and uses MongoDB for data storage.

## Features

  * **Personalized Recommendations:** Get tailored diet and exercise suggestions based on user profiles and goals.
  * **User Authentication:** Secure user registration and login.
  * **Data Management:** Integration with MongoDB for storing user data, health metrics, and recommendation logic.
  * **Interactive Frontend:** A dynamic and responsive user interface built with React.js.
  * **RESTful API:** A Flask backend serving as a robust API for communication between the frontend and database.

## Technologies Used

### Frontend

  * React
  * React Router DOM
  * React Icons
  * React Toastify
  * Chart.js & React Chart.js 2 (for data visualization)
  * Tailwind CSS (for styling)
  * Vite (build tool)

### Backend

  * Flask
  * Flask-CORS
  * Flask-Bcrypt (for password hashing)
  * Flask-JWT-Extended (for JWT-based authentication)
  * PyMongo (MongoDB driver for Python)
  * Pandas, NumPy, Scikit-learn, Joblib (for data processing and recommendation logic)
  * Python-Dotenv (for environment variables)

### Database

  * MongoDB

## Setup Instructions

### Prerequisites

Ensure you have the following installed on your system:

  * **Python:** Version 3.8 or higher. Make sure to add Python to your system's PATH during installation.
  * **Node.js:** Latest LTS version.

### 1\. Environment Variables

The project uses a `.env` file for configuration. A sample `.env` file is automatically created during setup if it doesn't exist. You may need to update it based on your specific MongoDB setup (especially if using MongoDB Atlas).

The `.env` file includes:

  * `JWT_SECRET_KEY`: A secret key for JWT authentication ( **important: change this in production**).
  * `MONGO_URI`: MongoDB connection URI (default: `mongodb://localhost:27017/health_app`).
  * `ADMIN_EMAIL`: Default admin user email.
  * `ADMIN_PASSWORD`: Default admin user password.
  * `PORT`: Port for the Flask backend (default: `5000`).

### 2\. Run the Setup Script

Navigate to the root directory of the project in your terminal and run the `setup.bat` script:

```bash
setup.bat
```

This script will:

  * Verify Python and Node.js installations.
  * Create the `.env` file if it doesn't exist.
  * Install Python dependencies using `pip`.
  * Install Node.js dependencies using `npm`.
  * Set up MongoDB (if `mongod` is found in your PATH) by creating the `mongodb-data` directory and initializing the `health_app` database with a `users` collection and a unique index on the `email` field.

If MongoDB is not found locally, the script will prompt you to configure `MONGO_URI` in the `.env` file for a cloud database like MongoDB Atlas.

## Running the Application

After successful setup, you can start the application using the `runner.bat` script:

```bash
runner.bat
```

This script will:

  * Check if MongoDB is running and start it if not.
  * Start the Flask backend server.
  * Start the React development server.

Once all services are started:

  * The **Backend** will be running at: `http://localhost:5000`
  * The **Frontend** will be accessible at: `http://localhost:5173`

## Default Admin Credentials

For initial access, you can use the following default admin credentials:

  * **Email:** `admin@example.com`
  * **Password:** `admin123`

It is highly recommended to change these credentials immediately after your first login.
