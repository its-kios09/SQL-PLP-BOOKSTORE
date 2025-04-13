# 📚 Bookstore SQL Database Project

[![CI - MySQL Schema Test](https://github.com/its-kios09/SQL-PLP-BOOKSTORE/actions/workflows/cicd.yml/badge.svg)](https://github.com/its-kios09/SQL-PLP-BOOKSTORE/actions)

---

## 🧠 Overview

This project simulates a real-world scenario where you're the database administrator for a **bookstore**. You'll design and implement a MySQL database to manage books, authors, customers, orders, and more.

By the end of this project, you’ll gain hands-on experience in SQL, database design, and automation with CI/CD pipelines.

---

## 🎯 Project Objective

- Design a normalized, relational database for a bookstore.
- Create SQL schemas for tables and relationships.
- Insert sample data and run meaningful queries.
- Secure the database using users and roles.
- Automate validation using GitHub Actions.

---

## 🧰 Tools & Technologies

- **MySQL** – Database engine
- **Draw.io** – Schema visualization
- **GitHub** – Collaboration and version control
- **GitHub Actions** – CI/CD pipeline for schema validation

---

## 🗃️ Database Schema

Key tables included:

- `book`, `author`, `book_author`
- `book_language`, `publisher`
- `customer`, `address`, `customer_address`, `address_status`, `country`
- `cust_order`, `order_line`
- `order_status`, `order_history`
- `shipping_method`

Relational integrity (e.g. foreign keys and constraints) is enforced to ensure data consistency.

---

## 🛢 Diagram

![Screenshot from 2025-04-13 19-53-06](https://github.com/user-attachments/assets/6d55bb16-87d6-473c-979c-7f6ab221a411)


## 📂 Project Structure

```bash
SQL-PLP-BOOKSTORE/
├── .github/
│   └── workflows/
│       └── ci.yml               # GitHub Actions workflow for CI/CD
├── bookstore_schema.sql         # Full SQL schema (DDL)
├── queries/                     # Folder to hold query files
│   └── test_queries.sql         # SQL SELECT/INSERT/UPDATE queries for testing
└── README.md                    # Project documentation

```

## 🚀 CI/CD Pipeline
We use GitHub Actions to automatically test and validate the schema whenever code is pushed or a pull request is made.

## ✅ Features:
- Starts a temporary MySQL server

- Applies bookstore_schema.sql

Runs queries from the queries/ folder (e.g., insert_query_data.sql) to verify schema and logic

## 🔄 Triggered on:
- Pushes to main branch

- Pull requests to main

## 🧩 Steps in CI/CD:
- MySQL container is started.

- Schema is loaded into the MySQL database.

- Queries from the queries/insert_query_data.sql file are executed for validation.


## 🤝 How to Contribute

We welcome contributions from everyone! If you'd like to collaborate on this project, follow these steps:

### 1. Fork the repository
Start by **forking** the repository to your GitHub account.

- Go to the repository page: [SQL-PLP-BOOKSTORE](https://github.com/its-kios09/SQL-PLP-BOOKSTORE)
- Click the **Fork** button (top right corner) to create a copy under your GitHub account.

### 2. Clone your fork
Next, **clone** your forked repository to your local machine:

```bash
git clone https://github.com/its-kios09/SQL-PLP-BOOKSTORE.git
```

#### 3.  Create a New Branch for Your Changes

```bash
git checkout -b feature/add-book-table
```

### 4. Commit Your Changes

```bash
git add .
git commit -m "(feat) Added book table schema"
git commit -m "(refactor) change book table schama"
git commit -m "chore") removed table"
```

### 5. Push Your Changes

```bash
git push origin feature/add-book-table
```
### 6. Open a Pull Request (PR)
Then one of the team member will review your changes
