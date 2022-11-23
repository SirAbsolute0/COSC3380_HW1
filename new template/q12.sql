/* 
Q12: show departure, arrival city, and number of flights,
 but only for delayed flights on a Boeing airplane. 
Write your query and store the result.
*/

DROP TABLE q12_delayed_boeing;
CREATE TABLE q12_delayed_boeing(
    departure_airport character(20),
    arrival_airport character(20),
    flights int
); 


/* 
Your code here
*/
INSERT INTO q12_delayed_boeing

SELECT 
    (SELECT airport.city FROM airline.airport WHERE airport.airport_code = flight.departure_airport),
    (SELECT airport.city FROM airline.airport WHERE airport.airport_code = flight.arrival_airport),
    COUNT(model) 
FROM airline.flight AS flight
LEFT JOIN airline.aircraft AS aircraft
    ON flight.aircraft_code = aircraft.aircraft_code
JOIN airline.airport AS airport_departure
    ON flight.departure_airport = airport_departure.airport_code
JOIN airline.airport AS airport_arrival
    ON flight.arrival_airport = airport_arrival.airport_code
WHERE model LIKE 'Boeing%' AND status = 'Delayed'
GROUP BY departure_airport, arrival_airport;