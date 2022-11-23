/* 
Q02: show passenger name, number of distinct booking ref #, number of tickets 
 for passengers whose first name is BORIS
*/


DROP TABLE q02_boris;
CREATE TABLE q02_boris(
    passenger_name text, 
    number_of_booking int,
    number_of_tickets int
); 

/* 
Your code here
*/
INSERT INTO q02_boris

SELECT passenger_name, COUNT(DISTINCT(book_ref)), COUNT(ticket_no) FROM airline.ticket
GROUP BY passenger_name
HAVING passenger_name LIKE 'Boris%';