CREATE DATABASE IF NOT EXISTS bookstore;

USE bookstore;

-- Table: book_language
CREATE TABLE
    book_language (
        language_id INT AUTO_INCREMENT PRIMARY KEY,
        language_name VARCHAR(50) NOT NULL,
        language_code CHAR(2) NOT NULL
    );

-- Table :Create publisher table
CREATE TABLE
    publisher (
        publisher_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100)
    );

-- Table: book table
CREATE TABLE
    book (
        book_id INT AUTO_INCREMENT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
        isbn VARCHAR(20) UNIQUE,
        publisher_id INT,
        language_id INT,
        num_pages INT,
        price DECIMAL(10, 2) NOT NULL,
        stock_quantity INT DEFAULT 0
    );

-- Table: author table
CREATE TABLE
    author (
        author_id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        biography TEXT
    );

-- Table: book_author
CREATE TABLE
    book_author (
        book_id INT NOT NULL,
        author_id INT NOT NULL,
        PRIMARY KEY (book_id, author_id)
    );

-- Table: Create country table
CREATE TABLE
    country (
        country_id INT AUTO_INCREMENT PRIMARY KEY,
        country_name VARCHAR(100) NOT NULL
    );

-- Table:  Create address_status table
CREATE TABLE
    address_status (
        status_id INT AUTO_INCREMENT PRIMARY KEY,
        status_value VARCHAR(20) NOT NULL
    );

-- Table: Create address table
CREATE TABLE
    address (
        address_id INT AUTO_INCREMENT PRIMARY KEY,
        street VARCHAR(255) NOT NULL,
        city VARCHAR(100) NOT NULL,
        postal_code VARCHAR(20),
        country_id INT
    );

-- Table: Create shipping_method table
CREATE TABLE
    shipping_method (
        method_id INT AUTO_INCREMENT PRIMARY KEY,
        method_name VARCHAR(50) NOT NULL,
        cost DECIMAL(10, 2) NOT NULL
    );

-- Table: Create order_status table
CREATE TABLE
    order_status (
        status_id INT AUTO_INCREMENT PRIMARY KEY,
        status_value VARCHAR(20) NOT NULL
    );

-- Table: Create cust_order table
CREATE TABLE
    cust_order (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT NOT NULL,
        shipping_method_id INT,
        order_date DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- Table: Create shipping_method table
CREATE TABLE
    shipping_method (
        method_id INT AUTO_INCREMENT PRIMARY KEY,
        method_name VARCHAR(50) NOT NULL,
        cost DECIMAL(10, 2) NOT NULL
    );

-- Table: Create order_status table
CREATE TABLE
    order_status (
        status_id INT AUTO_INCREMENT PRIMARY KEY,
        status_value VARCHAR(20) NOT NULL
    );

-- Table: Create cust_order table
CREATE TABLE
    cust_order (
        order_id INT AUTO_INCREMENT PRIMARY KEY,
        customer_id INT NOT NULL,
        shipping_method_id INT,
        order_date DATETIME DEFAULT CURRENT_TIMESTAMP
    );

-- Table: Add book foreign keys
ALTER TABLE book ADD CONSTRAINT fk_book_publisher FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
ADD CONSTRAINT fk_book_language FOREIGN KEY (language_id) REFERENCES book_language (language_id);

-- Table: Add book_author foreign keys
ALTER TABLE book_author ADD CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES book (book_id),
ADD CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES author (author_id);

-- Table: Add address foreign key
ALTER TABLE address ADD CONSTRAINT fk_address_country FOREIGN KEY (country_id) REFERENCES country (country_id);

-- Table: Create database users
CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'bookstore_staff'@'localhost' IDENTIFIED BY 'staff123';

-- Table: Assign privileges
GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore_admin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON bookstore.* TO 'bookstore_staff'@'localhost';