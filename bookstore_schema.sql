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

-- Table: Create customer table
CREATE TABLE
    customer (
        customer_id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL
    );

-- Table: Create customer_address table
CREATE TABLE
    customer_address (
        customer_id INT NOT NULL,
        address_id INT NOT NULL,
        status_id INT NOT NULL,
        PRIMARY KEY (customer_id, address_id)
    );

-- Table: Create order_line table
CREATE TABLE
    order_line (
        line_id INT AUTO_INCREMENT PRIMARY KEY,
        order_id INT NOT NULL,
        book_id INT NOT NULL,
        quantity INT NOT NULL,
        price DECIMAL(10, 2) NOT NULL
    );

-- Table: Create order_history table
CREATE TABLE
    order_history (
        history_id INT AUTO_INCREMENT PRIMARY KEY,
        order_id INT NOT NULL,
        status_id INT NOT NULL,
        status_date DATETIME DEFAULT CURRENT_TIMESTAMP
    );