/* Q11: * # of invalid tickets: tickets without a booking
Write your query and store the result..
*/

DROP TABLE q11_invalid_tickets;
CREATE TABLE q11_invalid_tickets(
    num_invalid int
); 


/* 
Your code here
*/
INSERT INTO q11_invalid_tickets

SELECT COUNT(booking.book_ref)
FROM airline.booking AS booking
LEFT JOIN airline.ticket AS ticket
    ON booking.book_ref = ticket.book_ref
WHERE ticket_no IS NULL;