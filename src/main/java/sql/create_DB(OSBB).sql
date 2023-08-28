CREATE SCHEMA `OSBB v.3` DEFAULT CHARACTER SET utf16 ;

CREATE TABLE building (
id TINYINT PRIMARY KEY AUTO_INCREMENT,
address VARCHAR(50) NOT NULL,
floors TINYINT NOT NULL,
number_of_apartments INT NOT NULL,
INDEX idx_address (address)
);


CREATE TABLE apartment(
id INT PRIMARY KEY AUTO_INCREMENT,
building_id TINYINT,
floor TINYINT NOT NULL,
area INT NOT NULL,
number_of_rooms TINYINT NOT NULL,
FOREIGN KEY (building_id) REFERENCES building(id)
);

CREATE TABLE resident(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
lastname VARCHAR(20) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
car_access BOOLEAN DEFAULT 0,
INDEX idx_name_and_lastname_resident (name, lastname)
);

CREATE TABLE residence(
id INT PRIMARY KEY AUTO_INCREMENT,
resident_id INT,
apartment_id INT,
date_start_stay DATE NOT NULL,
date_end_stay DATE NOT NULL,
FOREIGN KEY (resident_id) REFERENCES resident(id),
FOREIGN KEY (apartment_id) REFERENCES apartment(id)
);

CREATE TABLE resident_ownership(
id INT PRIMARY KEY AUTO_INCREMENT,
resident_id INT,
apartment_id INT,
FOREIGN KEY (resident_id) REFERENCES resident(id),
FOREIGN KEY (apartment_id) REFERENCES apartment(id)
);

CREATE TABLE osbb_member(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
lastname VARCHAR(20) NOT NULL,
phone VARCHAR(20) NOT NULL,
email VARCHAR(100) NOT NULL,
INDEX idx_name_lastname_osbb (name, lastname)
);

CREATE TABLE osbb_role(
id TINYINT PRIMARY KEY AUTO_INCREMENT,
role VARCHAR(20) NOT NULL
);

CREATE TABLE osbb_member_role (
member_id INT,
role_id TINYINT,
FOREIGN KEY (member_id) REFERENCES osbb_member(id),
FOREIGN KEY (role_id) REFERENCES osbb_role(id)
);

CREATE TABLE osbb_member_ownership(
id INT PRIMARY KEY AUTO_INCREMENT,
member_id INT,
apartment_id INT,
FOREIGN KEY (member_id) REFERENCES osbb_member(id),
FOREIGN KEY (apartment_id) REFERENCES apartment(id)
);






