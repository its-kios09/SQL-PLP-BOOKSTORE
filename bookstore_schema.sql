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