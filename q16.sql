/* Q16: 
list full airplane model name and city for flights 
where an Airbus airplane departs from or arrives to 
Write your query and store the result.
*/

DROP TABLE q16_airbus_city;
CREATE TABLE q16_airbus_city(
    model character(25),
    city character(20)
); 


/* 
Your code here
*/
INSERT INTO q16_airbus_city

SELECT DISTINCT model, city
FROM airline.flight AS flight
JOIN airline.airport AS airport
    ON flight.departure_airport = airport.airport_code
JOIN airline.aircraft AS aircraft
    ON flight.aircraft_code = aircraft.aircraft_code
WHERE model LIKE 'Airbus%'

UNION

SELECT DISTINCT model, city
FROM airline.flight AS flight
JOIN airline.airport AS airport
    ON flight.arrival_airport = airport.airport_code
JOIN airline.aircraft AS aircraft
    ON flight.aircraft_code = aircraft.aircraft_code
WHERE model LIKE 'Airbus%';