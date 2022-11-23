/* 
Q07: list ticket reference code and corresponding number of passengers 
        with exactly 3 passengers traveling together
        and whose reference code starts with 04F 
*/

DROP TABLE q07_bookings_passenger;
CREATE TABLE q07_bookings_passenger(
    book_ref character(6),
    passengers int
); 


/* 
Your code here
*/
INSERT INTO q07_bookings_passenger

SELECT book_ref, COUNT(passenger_id) AS number_passenger FROM airline.ticket
GROUP BY book_ref
HAVING book_ref LIKE '04F%' AND COUNT(passenger_id) = 3;