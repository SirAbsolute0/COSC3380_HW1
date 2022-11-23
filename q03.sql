/* 
Q03: list number of seats available per aircraft code in Economy class
*/

DROP TABLE q03_seats_aircraft;
CREATE TABLE q03_seats_aircraft(
    aircraft_code character(3),
    fare_conditions character(10), 
    seats int
); 


/* 
Your code here
*/
INSERT INTO q03_seats_aircraft

SELECT aircraft_code, fare_conditions, COUNT(seat_no) FROM airline.seat
GROUP BY aircraft_code, fare_conditions
HAVING fare_conditions = 'Economy';