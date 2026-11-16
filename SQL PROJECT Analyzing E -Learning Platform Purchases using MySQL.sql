-- CREATE DATABSE DATABASE_NAME 
create database elearning_platform ;
use elearning_platform;

-- CREATE TABLE 1 TABLE_NAME 
create table learners (
learner_id int primary key,
full_name varchar(100) NOT NULL,
country varchar(50) NOT NULL)
;

-- CREATE TABLE 2 TABLE_NAME
create table courses(
course_id int primary key ,
course_name varchar(100) NOT NULL,
category varchar(50) NOT NULL,
unit_price decimal(10,2) NOT NULL)
;

-- CREATE TABLE 3 TABLE_NAME
create table purchases (
purchase_id int primary key ,
learner_id int NOT NULL,
course_id int NOT NULL,
quantity int NOT NULL,
purchase_date date  NOT NULL,

foreign key (learner_id)
references learners(learner_id),

foreign key ( course_id)
references	courses(course_id)
);

select * from learners;
select * from courses;
select * from purchases;

-- INSERT INTO TABLE LEARNERS
insert into learners (learner_id, full_name, country)
values
(1, 'Latha Shri', 'India'),
(2,'Deepa Shri','UK'),
(3,'Diya Shri','USA'),
(4,'Nilan Aadvik','India'),
(5,'Priya','Canada');
select * from learners;

-- INSERT INTO TABLE COURSES
insert into courses (course_id, Course_name, Category, unit_price)
values
(101,'Python for Beginners','Programming', 49.99),
(102, 'Data Analysis with excel','Data Analytics',39.99),
(103,'Machine Learning','Artificial Intelligence',59.99),
(104,'U1/UX Design Basics','Design',44.50),
(105,'Digital Marketing 101','Marketing',34.99);
select * from courses;

-- INSERT INTO TABLE PURCHASES
insert into purchases ( Purchase_id, learner_id, course_id, quantity, Purchase_date)
values
(1001, 1, 101, 1, '2025-01-10'),
(1002, 2, 102, 2, '2026-01-12'),
(1003, 3, 103, 3, '2026-01-15'),
(1004, 1, 101, 1, '2026-02-05'),
(1005, 4, 104, 2, '2026-02-10'),
(1006, 5, 105, 1, '2026-02-15'),
(1007, 2, 103, 1, '2026-03-01'),
(1008, 4, 102, 1, '2026-03-05');

select * from purchases;

-- INNER JOINS-- matching records--
SELECT
    l.full_name AS learner_name,
    c.course_name AS course_name,
    c.category AS category,
    p.quantity AS quantity,
    FORMAT(c.unit_price * p.quantity, 2) AS total_amount,
    p.purchase_date AS purchase_date
FROM purchases p
INNER JOIN learners l
    ON p.learner_id = l.learner_id
INNER JOIN courses c
    ON p.course_id = c.course_id
ORDER BY total_amount DESC;

-- LEFT JOINS-- displaying all the learners with their purchases--

 select 
 l.full_name AS learner_name,
 l.country AS country,
 c.course_name AS course_name,
 p.quantity AS quantity
 FROM learners l
 LEFT JOIN purchases p ON l.learner_id = p.learner_id
 LEFT JOIN courses c ON p.course_id = c.course_id 
 ORDER BY l.learner_id ;
 
 -- RIGHT JOINS -- display all courses and the purchases--
 
select 
 c.course_name AS course_name,
       c.category AS category,
       p.purchase_id AS purchase_id,
       p.quantity AS quantity
FROM purchases p
RIGHT JOIN courses c ON p.course_id = c.course_id
ORDER BY c.course_id;

-- Display each learner’s total spending (quantity × unit_price) along with their country--

SELECT
l.full_name AS learner_name,
l.country AS country,
Format(sum(c.unit_price * p.quantity),2) AS total_spent
FROM learners l
INNER JOIN purchases p ON l.learner_id = p.learner_id
INNER JOIN courses   c ON p.course_id  = c.course_id
GROUP BY l.learner_id, l.full_name, l.country
ORDER BY total_spent DESC;

-- Find the top 3 most purchased courses based on total quantity sold What is the question asking? --

SELECT
 c.course_name AS course_name,
       SUM(p.quantity) AS total_quantity_sold
FROM courses c
INNER JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_quantity_sold DESC, c.course_name
LIMIT 3;

-- Show each course category's total revenue and number of unique learners who purchased from that category.--

SELECT 
c.category AS category,
       format(SUM(p.quantity * c.unit_price), 2) AS total_revenue,
       COUNT(DISTINCT p.learner_id) AS unique_learners
FROM courses c
INNER JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.category
ORDER BY total_revenue DESC;

-- List all learners who have purchased courses from more than one category.--

SELECT
 l.full_name AS learner_name,
       COUNT(DISTINCT c.category) AS categories_purchased
FROM learners l
INNER JOIN purchases p ON l.learner_id = p.learner_id
INNER JOIN courses   c ON p.course_id  = c.course_id
GROUP BY l.learner_id, l.full_name
HAVING COUNT(DISTINCT c.category) > 1
ORDER BY categories_purchased DESC;


-- Identify courses that have not been purchased at all.--

SELECT 
c.course_id AS course_id,
       c.course_name AS course_name,
       c.category AS category
FROM courses c
LEFT JOIN purchases p ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL;



 






