/* 
Q17: 
Show departure city,arrival city,plane model and status
of flights arrived on time and delayed
departing from Belgorod
Write your query and store the result.
*/

DROP TABLE q17_belgorod;
CREATE TABLE q17_belgorod(
    d_city character(20),
    a_city character(20),
    model character(25),
    status character varying (20)
); 


/* 
Your code here
*/
INSERT INTO q17_belgorod

SELECT departure_airport, arrival_airport, model, status 
FROM airline.flight as flight, airline.airport AS airport1, airline.airport AS airport2, airline.aircraft AS aircraft
WHERE ((status = 'On Time') OR (status = 'Delayed')) AND (airport1.city = 'Belgorod');