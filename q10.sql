/* 
Q10: show the earliest and latest dates across all booked flights, 
   i.e. to have an idea the time span of the database.
   Show date information, without time of day 
Write your query and store the result.
*/

DROP TABLE q10_span_date;
CREATE TABLE q10_span_date(
    earliest date,
    latest date
); 


/* 
Your code here
*/
INSERT INTO q10_span_date

SELECT MIN(CAST(book_date AS date)), MAX(CAST(book_date AS date)) FROM airline.booking;