


-- we have three table. workout, exercise and workout_exercise_relation
-- Select all exercise as comma seperated for a certain workout.id
SELECT w.name,w.id, string:agg(we.exercise_id,",") AS workoutlist
FROM workout w
INNER JOIN workout_exercise we ON w.id = we.workoutid
WHERE w.id = $workoutid$
GROUP BY(w.id,w.name)
ORDER BY we.sequence_no

-- Maximum Salary
SELECT MAX(salary)
FROM employee

SELECT MAX(salary)
FROM employee
GROUP BY department


-- subquery example1 returning single row
SELECT book_id, title, isbn13, language_id, num_pages, publication_date, publisher_id
FROM book
WHERE num_pages > (
  SELECT AVG(num_pages)
  FROM book
);

-- subquery with multiple row return
SELECT
book_id,
title
FROM book
WHERE language_id IN (
  SELECT language_id
  FROM book_language
  WHERE language_code IN ('eng', 'en-GB', 'en-CA', 'en-US')
);

-- subquery with multiple column
SELECT
co.order_id,
co.order_date,
co.customer_id,
a.address_id,
a.street_number,
a.street_name,
a.city,
c.country_name
FROM cust_order co
INNER JOIN address a ON co.dest_address_id = a.address_id
INNER JOIN country c ON a.country_id = c.country_id
WHERE (a.city, c.country_name) IN (
  SELECT
  a.city,
  co.country_name
  FROM address a
  INNER JOIN customer_address ca ON a.address_id = ca.address_id
  INNER JOIN country co ON a.country_id = co.country_id
  WHERE ca.customer_id = 26
);

-- subquery selecting details of book with maximum price
SELECT
title, 
isbn13,
publication_date
FROM book
WHERE book_id IN (
	SELECT book_id
	FROM order_line
	WHERE price = (
		SELECT MAX(price)
		FROM order_line
	)
);

-- correlated query (We want to see books that are longer, or have a higher number of pages, than the average number of pages for that book’s publisher.)
-- same can be written using joins
SELECT
book_id,
title,
num_pages,
publisher_id
FROM book b1
WHERE num_pages > (
  SELECT
  AVG(num_pages)
  FROM book b2
  WHERE b2.publisher_id = b1.publisher_id
);

-- subquery + select1 (get overall averge column)
SELECT
book_id,
title,
num_pages,
publisher_id,
(
  SELECT AVG(num_pages)
  FROM book
) AS overall_avg
FROM book;

-- subquery + select2 (get average of each publisher)
SELECT
book_id,
title,
num_pages,
publisher_id,
(
  SELECT AVG(b2.num_pages)
  FROM book b2
  WHERE b2.publisher_id = b1.publisher_id
) AS avg_for_publisher
FROM book b1;

-- subquery + having
SELECT
CONVERT(date, order_date) AS order_date_only,
COUNT(*)
FROM cust_order
GROUP BY CONVERT(date, order_date)
HAVING COUNT(*) >= (
	SELECT COUNT(*)
	FROM cust_order
	WHERE CONVERT(date, order_date) = '2020-01-01'
)
ORDER BY CONVERT(date, order_date) ASC;


-- subquery + select
INSERT INTO order_summary (order_date, order_count)
VALUES ('2021-01-01', (
  SELECT COUNT(*)
  FROM cust_order
  WHERE DATE(order_date) = '2021-01-01'
  )
);

-- add a comment to a book if it was published after the very first order we created in our system.
UPDATE book b
SET b.comments = (
  SELECT COUNT(*)
  FROM order_line o
  WHERE o.book_id = b.book_id
);

-- CTE example
```sql
WITH it_employees (emp_id,first_name,title) AS
(
    SELECT emp_id,first_name,title
    FROM employee
    WHERE dept_id = 2
)
SELECT first_name,title
FROM it_employees
```

-- multiple CTEs in select statement
WITH 
it_employees (emp_id,first_name,title) AS
(
    SELECT emp_id,first_name,title
    FROM employee
    WHERE dept_id = 2
),
hr_employees (emp_id,first_name,title) AS
(
    SELECT emp_id,first_name,title
    FROM employee
    WHERE dept_id = 3
)
SELECT first_name,title
FROM it_employees