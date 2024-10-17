/*  Q1. Write query to return the email, first name, last name, and Genre of all rock music listeners return your list ordered
albhabetically by email starting with A    */

select *from customer
select *from genre

SELECT first_name, last_name, email
FROM customer 
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
select track_id FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock'
)
ORDER BY email;

/*   Q2. Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.      */

select *from artist
select *from track

select artist.name, artist.artist_id, COUNT(artist.artist_id) As number_of_songs
From track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


/*  Q3. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.  */


select name, milliseconds
from track
where milliseconds>(
SELECT AVG(milliseconds) AS avg_track_length
FROM track

)
ORDER BY milliseconds DESC;










