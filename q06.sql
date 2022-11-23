/*
Q06: how many unique airports are there considering departures in a flight?
Write your query and store the result.
*/

DROP TABLE q06_available_airports;
CREATE TABLE q06_available_airports(
    airports int
); 


/* 
Your code here
*/
INSERT INTO q06_available_airports

SELECT COUNT(departure_airport) FROM (
    SELECT departure_airport FROM airline.flight
    GROUP BY departure_airport
) AS flight;
    

