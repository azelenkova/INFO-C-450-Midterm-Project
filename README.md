# INFO-C-450-Midterm-Project
# Airline Ticket Booking System

The Airline Ticket Booking System is a simple ticket booking app for airlines. Users can view available flights, book tickets, and manage reservations. The system has three main parts:

1. **C++ Backend** - Handles logic and connects to MySQL database.
2. **MySQL Database** - Stores flight, passenger, ticket, and reservation data.
3. **HTML/CSS Frontend** - Provides an easy-to-use interface for customers.

## Prerequisites

You will need the following to run this project:
- **C++ Compiler** (e.g., GCC or MinGW)
- **MySQL Database Server**
- **MySQL Connector for C++** 
- **Web Browser** (for the HTML interface)

## Project Structure

Here is a breakdown of the project:

- **`src/`** - Contains C++/CSS files:
  - `airlinebooking.cpp` - Main application logic.
- **`sql/`** - Contains the SQL file:
  - `database.sql` - SQL script for the database structure.
- **`frontend/`** - Contains the HTML/CSS interface:
  - `index.html` - Home page.
  - `help.html` - Help page.
  - `contact.html` - Contact page.
  - `profile.html`- Profile page.
  - `reservations.html`- Reservations page. 
  - `search_flights` -Search flights. 
  - `styles.css` - CSS for styling.
- **README.md** - Documentation.

### Database Setup

Run the SQL script `airline_schema.sql` located in the `sql/` folder. You can do this using MySQL CLI or a GUI tool like MySQL Workbench:
   
   ```sql
   SOURCE path/to/airline_schema.sql;

In the database.cpp file, update the database credentials to match your MySQL server settings:

cpp
const std::string DB_HOST = "localhost";
const std::string DB_USER = "your_username";
const std::string DB_PASS = "your_password";
const std::string DB_NAME = "airline_booking_system";

C++ Backend Setup
Install the MySQL Connector/C++. This library enables the C++ application to communicate with the MySQL database.

Configure your compiler’s linker to use this library.

Compile the C++ code by running the following command:
g++ -o airline_booking src/*.cpp -lmysqlcppconn

Frontend Setup
Open frontend/index.html in a web browser to access the user interface.


