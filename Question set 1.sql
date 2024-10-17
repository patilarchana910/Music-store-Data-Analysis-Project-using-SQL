-- Q1. Who is the senior most employee based on job title?

select * from employee;

select first_name,levels
FROM employee
ORDER BY levels DESC
LIMIT 1



/*Q2. Which countries have the most Invoices?*/
select *from invoice

select COUNT(*) as most_invoice, billing_country
from invoice
GROUP BY billing_country
ORDER BY most_invoice DESC

-- Q3. What are top 3 values of total invoice

select total
from invoice 
ORDER BY total DESC
LIMIT 3

/*  Q4. Which city has the best customers? We would like to throw a promotional Music festival
in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals.
Return both city name and sum of all invoice totals.    */

select SUM(total) as invoice_total, billing_city
from invoice
Group BY billing_city
ORDER BY invoice_total DESC

/* Q5. Who is the best customer? The customer who has spend the most money will be declared the best customer.
Write a query that returns the person who has spent the most money?    */

select *from customer

select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1
















