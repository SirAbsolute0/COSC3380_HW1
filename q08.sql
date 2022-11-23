/*
Q08: total $ amount for bookings in July with cost more than 50,000  
Write your query and store the result.
*/

DROP TABLE q08_bookings_date;
CREATE TABLE q08_bookings_date(
    total_amount numeric(13,2)
); 


/* 
Your code here
*/
INSERT INTO q08_bookings_date

SELECT SUM(total_amount) FROM airline.booking
WHERE CAST(book_date AS TEXT) LIKE '%-07-%' AND total_amount > 50000;