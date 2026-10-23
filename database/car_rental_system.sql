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

-- Sample data: real cars available for rent (photos in web/cars, credits in web/cars/CREDITS.md)
INSERT IGNORE INTO car_brand (bname, brand_image, brand_desc) VALUES
('Maruti Suzuki', 'cars/swift.jpg',    'India''s largest carmaker. Fuel-efficient, low-maintenance hatchbacks and MPVs with service centres in every town.'),
('Hyundai',       'cars/creta.png',    'Feature-rich hatchbacks and SUVs from South Korea, known for premium interiors and smooth automatics.'),
('Tata',          'cars/nexon.jpg',    'Home-grown Indian brand with some of the safest cars on Indian roads, many rated 5 stars by Global NCAP.'),
('Honda',         'cars/city.jpg',     'Japanese sedans with refined i-VTEC petrol engines, spacious cabins and a reputation for reliability.'),
('Mahindra',      'cars/thar.jpg',     'Tough, capable SUVs built for Indian roads, from the iconic Thar off-roader to the 7-seater XUV700.'),
('Toyota',        'cars/fortuner.jpg', 'Bulletproof reliability and strong resale value. The Fortuner is India''s favourite full-size SUV.'),
('BMW',           'cars/x1.jpg',       'German luxury and driving pleasure. Premium cabins and sporty handling for special occasions.');

INSERT IGNORE INTO car_details (car_name, car_brand, seating_capacity, image1, image2, rate_per_day, mileage, car_description) VALUES
('Maruti Suzuki Swift',  'Maruti Suzuki', 5, 'cars/swift.jpg',    'cars/swift.jpg',    1499, '24.8', 'The all-new Swift with a 1.2L Z-series petrol engine and 5-speed manual. Light, peppy and easy to park, with a 9-inch touchscreen, Android Auto / Apple CarPlay and 6 airbags.'),
('Maruti Suzuki Ertiga', 'Maruti Suzuki', 7, 'cars/ertiga.jpg',   'cars/ertiga.jpg',   2499, '20.5', '7-seater MPV with a 1.5L K-series petrol mild-hybrid engine and roof-mounted AC vents for the second and third rows. Ideal for family trips and airport runs.'),
('Hyundai i20',          'Hyundai',       5, 'cars/i20.jpg',      'cars/i20.jpg',      1699, '20.3', 'Premium hatchback with a 1.2L Kappa petrol engine, digital instrument cluster, wireless phone charger and 6 airbags as standard.'),
('Hyundai Creta',        'Hyundai',       5, 'cars/creta.png',    'cars/creta.png',    2799, '17.4', 'India''s best-selling midsize SUV. 1.5L petrol with IVT automatic, panoramic sunroof, ventilated front seats and a 360-degree camera.'),
('Tata Nexon',           'Tata',          5, 'cars/nexon.jpg',    'cars/nexon.jpg',    1999, '17.4', '5-star Global NCAP rated compact SUV with a 1.2L turbo-petrol engine, 10.25-inch touchscreen and 208 mm ground clearance for bad roads.'),
('Honda City',           'Honda',         5, 'cars/city.jpg',     'cars/city.jpg',     2299, '17.8', 'Spacious mid-size sedan with a refined 1.5L i-VTEC petrol and CVT automatic. Huge 506-litre boot, sunroof and Honda Sensing safety features.'),
('Mahindra Thar',        'Mahindra',      4, 'cars/thar.jpg',     'cars/thar.jpg',     3499, '15.2', 'Iconic 4x4 off-roader with a 2.2L mHawk diesel, shift-on-the-fly 4WD and 226 mm ground clearance. Built for hills, beaches and weekend adventures.'),
('Mahindra XUV700',      'Mahindra',      7, 'cars/xuv700.png',   'cars/xuv700.png',   3999, '16.5', 'Flagship 7-seater SUV with a 2.2L diesel and 6-speed automatic, twin 10.25-inch screens, panoramic sunroof and ADAS driver assistance.'),
('Toyota Fortuner',      'Toyota',        7, 'cars/fortuner.jpg', 'cars/fortuner.jpg', 5499, '14.2', 'Full-size 4x4 SUV with a 2.8L diesel and 6-speed automatic. Commanding road presence and legendary Toyota reliability for long highway trips.'),
('BMW X1',               'BMW',           5, 'cars/x1.jpg',       'cars/x1.jpg',       7999, '16.3', 'Luxury compact SUV with a 1.5L turbo-petrol and 7-speed dual-clutch automatic, curved display and panoramic sunroof. Perfect for weddings and business travel.');
