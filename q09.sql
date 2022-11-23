/* 
Q09: list cities that have 2 or more airports 
Write your query and store the result.
*/

DROP TABLE q09_city_airport;
CREATE TABLE q09_city_airport(
    city character(20)
); 


/* 
Your code here
*/
INSERT INTO q09_city_airport

SELECT city FROM airline.airport
GROUP BY city
HAVING COUNT(airport_name) >= 2;