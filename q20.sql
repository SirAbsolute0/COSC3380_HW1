/*
Q20
show #tickets,total $ spent, and # of tickets bought for each different month
for passenger SERGEY RODIONOV
displaying all information in one row (i.e. each month is one column)
hint: use CASE .. WHEN .. END statement and DATE functions
*/

DROP TABLE q20_sergey;
CREATE TABLE q20_sergey(
   tickets int,
   spent numeric(10,2),
   month1 int,
   month2 int,
   month3 int

);

/* your code here */
INSERT INTO q20_sergey

SELECT COUNT(ticket), SUM(total_amount), 
         CASE 
            WHEN EXTRACT(MONTH from book_date) = 7 THEN COUNT(Ticket)
         END "month"
FROM airline.ticket AS ticket
JOIN airline.booking AS booking
   ON ticket.book_ref = booking.book_ref
WHERE passenger_name = 'SERGEY RODIONOV'
ORDER BY booking.book_date;
