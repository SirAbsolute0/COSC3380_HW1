/* 
Q14: # tickets sold and sales amount per fare class, only for arrived flights,
   excluding Business class 
Write your query and store the result.
*/

DROP TABLE q14_fare_tickets;
CREATE TABLE q14_fare_tickets(
    fare_conditions character(10),
    ticket int,
    amount numeric (12,2)
);


/* 
Your code here
*/

INSERT INTO q14_fare_tickets

SELECT fare_conditions, COUNT(DISTINCT(ticket_no)), SUM(amount)  FROM airline.ticket_flight AS ticket_flight
JOIN airline.flight AS flight
    ON ticket_flight.flight_id = flight.flight_id
WHERE fare_conditions != 'Business' AND status = 'Arrived'
GROUP BY fare_conditions;