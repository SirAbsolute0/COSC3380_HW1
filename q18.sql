/* 
Q18: 
show full airplane model name and city for flights 
departing from Europe
exclude duplicate rows
Write your query and store the result.
*/

DROP TABLE q18_departing_europe;
CREATE TABLE q18_departing_europe(
    model character(25),
    city character(20)
); 


/* 
Your code here
*/
INSERT INTO q18_departing_europe

SELECT DISTINCT model, city FROM airline.flight AS flight
JOIN airline.aircraft AS aircraft   
    ON flight.aircraft_code = aircraft.aircraft_code
JOIN airline.airport AS airport
    ON flight.departure_airport = airport.airport_code
WHERE timezone LIKE '%Europe%';