--1. List all books along with their publisher and language
SELECT 
    b.title,
    p.name AS publisher,
    l.language_name
FROM book b
JOIN publisher p ON b.publisher_id = p.publisher_id
JOIN book_language l ON b.language_id = l.language_id;


--2. Find all authors who have written more than one book

SELECT 
    a.name,
    COUNT(ba.book_id) AS books_written
FROM author a
JOIN book_author ba ON a.author_id = ba.author_id
GROUP BY a.author_id
HAVING COUNT(ba.book_id) > 1;

3. Get the top 5 most expensive books

SELECT 
    title,
    price
FROM book
ORDER BY price DESC
LIMIT 5;
4. List all books that are currently out of stock
sql
Copy
Edit
SELECT 
    title,
    stock_quantity
FROM book
WHERE stock_quantity = 0;


--5. Get the total number of books per publisher

SELECT 
    p.name AS publisher,
    COUNT(b.book_id) AS total_books
FROM publisher p
LEFT JOIN book b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_id;


--6. List all books with fewer than 100 pages

SELECT 
    title,
    num_pages
FROM book
WHERE num_pages < 100;


--7. Show the total stock value per publisher (price × stock quantity)
SELECT 
    p.name AS publisher,
    SUM(b.price * b.stock_quantity) AS stock_value
FROM book b
JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY p.publisher_id;


--8. Display all languages available in the bookstore and the number of books in each
SELECT 
    l.language_name,
    COUNT(b.book_id) AS num_books
FROM book_language l
LEFT JOIN book b ON l.language_id = b.language_id
GROUP BY l.language_id;


--9. Find books with no assigned author

SELECT 
    b.title
FROM book b
LEFT JOIN book_author ba ON b.book_id = ba.book_id
WHERE ba.author_id IS NULL;
