/* 
Q12: show departure, arrival city, and number of flights,
 but only for delayed flights on a Boeing airplane. 
Write your query and store the result.
*/

DROP TABLE q12_delayed_boeing;
CREATE TABLE q12_delayed_boeing(
    departure_airport character(3),
    arrival_airport character(3),
    flights int
); 


/*
Your code here
*/
INSERT INTO q12_delayed_boeing

SELECT departure_airport, arrival_airport, COUNT(model) 
FROM airline.flight AS flight
LEFT JOIN airline.aircraft AS aircraft
    ON flight.aircraft_code = aircraft.aircraft_code
WHERE model LIKE 'Boeing%' AND status = 'Delayed'
GROUP BY departure_airport, arrival_airport;
