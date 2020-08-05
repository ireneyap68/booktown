-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects;
-- 2. Find all subjects sorted by location
SELECT * FROM location;

-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM title WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT subject.location FROM subjects WHERE location = 'Main St';

-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
SELECT title FROM books WHERE subject_id = book.id;

-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT title, first_name, last_name, subject
FROM
    books,
    authors,
    subjects
WHERE
    books.author_id = authors.id AND
    books.subject_id = subjects.id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT title, retail
FROM
    books,
    editions,
    stock
WHERE
    books.id = editions.book_id
AND
    editions.isbn = stock.isbn;
-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price
SELECT books.title, editions.isbn, publishers.name, stock.retail
FROM
    books, editions, publishers, stock
WHERE
    books.id = editions.book_id
AND
    editions.isbn = stock.isbn
AND
    editions.publisher_id = publishers.id
AND
    books.title = 'Dune';
-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title
SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM
    books, customers, editions, shipments
WHERE
    customers.id = shipments.customer_id
AND
    shipments.isbn = editions.isbn
AND
    editions.book_id = books.id;

-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT count(*) FROM books;
-- 12. Get the COUNT of all Locations
SELECT count(location) FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, count(location) 
FROM subjects GROUP BY location; 

-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT
    books.id, books.title, count(editions.edition)
FROM
    books, editions
WHERE
    books.id = editions.book_id
GROUP BY
    books.id;