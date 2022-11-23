/* 
Q13: 
 show the city with lowest ticket sales amount in Economy class
Write your query and store the result.
*/

DROP TABLE q13_ticket_sales;
CREATE TABLE q13_ticket_sales(
    city character varying(20),
    amount numeric(8,2)
); 


/* 
Your code here
*/
INSERT INTO q13_ticket_sales

SELECT city, SUM(amount) 
FROM airline.airport AS airport
JOIN airline.flight AS flight
    ON airport.airport_code = flight.departure_airport
JOIN airline.ticket_flight AS ticket_flight
    ON flight.flight_id = ticket_flight.flight_id
GROUP BY city, ticket_flight.fare_conditions
HAVING ticket_flight.fare_conditions = 'Economy'
ORDER BY SUM(amount) ASC
LIMIT 1;