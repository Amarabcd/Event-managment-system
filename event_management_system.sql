
-- Create Database
CREATE DATABASE IF NOT EXISTS EventManagementSystem;
USE EventManagementSystem;

-- Create Client Table
CREATE TABLE Client (
    Client_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255)
);

-- Create Venue Table
CREATE TABLE Venue (
    Venue_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Capacity INT,
    Rent DECIMAL(10,2)
);

-- Create Event Table
CREATE TABLE Event (
    Event_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50),
    Date DATE,
    Time TIME,
    Venue_ID INT,
    Client_ID INT,
    FOREIGN KEY (Venue_ID) REFERENCES Venue(Venue_ID),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID)
);

-- Create Staff Table
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    Phone VARCHAR(15),
    Salary DECIMAL(10,2)
);

-- Create Event_Staff Table
CREATE TABLE Event_Staff (
    Event_ID INT,
    Staff_ID INT,
    PRIMARY KEY (Event_ID, Staff_ID),
    FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- Insert Sample Data into Client Table
INSERT INTO Client (Name, Phone, Email, Address) VALUES
('John Doe', '9876543210', 'john@example.com', 'New York'),
('Jane Smith', '9123456789', 'jane@example.com', 'California');

-- Insert Sample Data into Venue Table
INSERT INTO Venue (Name, Address, Capacity, Rent) VALUES
('Grand Hall', 'Downtown NY', 500, 2000.00),
('Sunrise Arena', 'California Blvd', 300, 1500.00);

-- Insert Sample Data into Event Table
INSERT INTO Event (Name, Type, Date, Time, Venue_ID, Client_ID) VALUES
('Wedding Ceremony', 'Wedding', '2025-05-20', '18:00:00', 1, 1),
('Corporate Meetup', 'Corporate', '2025-06-15', '10:00:00', 2, 2);

-- Insert Sample Data into Staff Table
INSERT INTO Staff (Name, Role, Phone, Salary) VALUES
('Alice Johnson', 'Manager', '9876543211', 50000.00),
('Bob Williams', 'Decorator', '9876543212', 30000.00);

-- Insert Sample Data into Event_Staff Table
INSERT INTO Event_Staff (Event_ID, Staff_ID) VALUES
(1, 1),
(1, 2),
(2, 1);
