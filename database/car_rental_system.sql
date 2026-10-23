-- Car Rental System database
-- Run in MySQL:  mysql -u root -p < database/car_rental_system.sql

CREATE DATABASE IF NOT EXISTS car_rental_system;
USE car_rental_system;

-- Registered customers
CREATE TABLE IF NOT EXISTS ureg (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    fname    VARCHAR(100) NOT NULL,
    addres   VARCHAR(255),
    ctno     VARCHAR(15),
    email    VARCHAR(100),
    gender   VARCHAR(10),
    uname    VARCHAR(50)  NOT NULL UNIQUE,
    psd      VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS car_brand (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    bname       VARCHAR(50) NOT NULL UNIQUE,
    brand_image VARCHAR(255),
    brand_desc  TEXT
);

CREATE TABLE IF NOT EXISTS car_details (
    car_id           INT AUTO_INCREMENT PRIMARY KEY,
    car_name         VARCHAR(100) NOT NULL UNIQUE,
    car_brand        VARCHAR(50)  NOT NULL,
    seating_capacity INT,
    image1           VARCHAR(255),
    image2           VARCHAR(255),
    rate_per_day     DECIMAL(10,2) NOT NULL,
    mileage          VARCHAR(20),
    car_description  TEXT,
    FOREIGN KEY (car_brand) REFERENCES car_brand(bname) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS bookings (
    booking_id    INT AUTO_INCREMENT PRIMARY KEY,
    fname         VARCHAR(100) NOT NULL,
    car_name      VARCHAR(100) NOT NULL,
    price_per_day DECIMAL(10,2),
    start_date    DATE,
    end_date      DATE,
    total_days    INT,
    total_price   DECIMAL(10,2),
    booking_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Only the last 4 card digits are kept; the CVV is never stored.
CREATE TABLE IF NOT EXISTS payment (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    payment_method VARCHAR(20) NOT NULL,
    full_name      VARCHAR(100),
    card_number    VARCHAR(20),
    expiry_date    VARCHAR(10),
    upi_id         VARCHAR(100),
    payment_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS feedback (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    fname        VARCHAR(100) NOT NULL,
    email        VARCHAR(100),
    message      TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data so the site is not empty on first run
INSERT IGNORE INTO car_brand (bname, brand_image, brand_desc) VALUES
('Honda',   'car2.jfif', 'Reliable Japanese sedans known for comfort and fuel efficiency.'),
('Hyundai', 'car7.jfif', 'Feature-packed SUVs and hatchbacks with great value for money.'),
('Maruti',  'car8.jfif', 'India''s favourite budget cars - easy to drive and cheap to run.'),
('Toyota',  'car9.jfif', 'Rugged, powerful SUVs built for long trips and rough roads.');

INSERT IGNORE INTO car_details (car_name, car_brand, seating_capacity, image1, image2, rate_per_day, mileage, car_description) VALUES
('Honda City',      'Honda',   5, 'car2.jfif', 'car1.jfif', 1500, '18', 'Premium sedan with a smooth CVT and spacious cabin.'),
('Hyundai Creta',   'Hyundai', 5, 'car7.jfif', 'car3.jfif', 1800, '16', 'Compact SUV with sunroof, touchscreen and high ground clearance.'),
('Maruti Swift',    'Maruti',  5, 'car8.jfif', 'car4.jfif', 1200, '22', 'Peppy hatchback, perfect for city drives.'),
('Toyota Fortuner', 'Toyota',  7, 'car9.jfif', 'car5.jfif', 3500, '12', '4x4 full-size SUV for family road trips.');
