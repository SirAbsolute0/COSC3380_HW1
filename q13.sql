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

SELECT seat.fare_conditions, city, amount FROM airline.seat AS seat
JOIN airline.airport AS airport 
    ON seat.aircraft_code = airport.airport_code
JOIN airline.flight AS flight
    ON seat.aircraft_code = flight.aircraft_code
JOIN airline.ticket_flight AS ticket_flight
    ON flight.flight_id = ticket_flight.flight_id;