-- Database creation
CREATE DATABASE IF NOT EXISTS airline_booking_system;
USE airline_booking_system;

-- 1. Airports Table
CREATE TABLE airports (
    airport_id INT AUTO_INCREMENT PRIMARY KEY,
    airport_code VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    country VARCHAR(50)
);

-- 2. Flights Table
CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(10) NOT NULL UNIQUE,
    origin_airport_id INT,
    destination_airport_id INT,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    seats_available INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (origin_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES airports(airport_id)
);

-- 3. Passengers Table
CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    passport_number VARCHAR(20) UNIQUE
);

-- 4. Tickets Table
CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    seat_number VARCHAR(5),
    booking_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id)
);

-- 5. Reservations Table
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT NOT NULL,
    ticket_id INT NOT NULL,
    reservation_status ENUM('confirmed', 'pending', 'canceled') DEFAULT 'pending',
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);

-- 6. Payments Table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_status ENUM('completed', 'failed') DEFAULT 'completed',
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id)
);

-- Sample Data
INSERT INTO airports (airport_code, name, city, country)
VALUES
    ('LAX', 'Los Angeles International', 'Los Angeles', 'USA'),
    ('JFK', 'John F. Kennedy International', 'New York', 'USA'),
    ('CDG', 'Charles de Gaulle', 'Paris', 'France');

INSERT INTO flights (flight_number, origin_airport_id, destination_airport_id, departure_time, arrival_time, seats_available, price)
VALUES
    ('AA101', 1, 2, '2024-12-01 10:00:00', '2024-12-01 18:00:00', 100, 350.00),
    ('AF456', 3, 1, '2024-12-05 12:00:00', '2024-12-05 15:30:00', 80, 550.00);

INSERT INTO passengers (first_name, last_name, email, phone, passport_number)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '1234567890', 'A12345678'),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321', 'B87654321');