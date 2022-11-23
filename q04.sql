/* 
Q04: how many airports are located in Europe? 
*/

DROP TABLE q04_airport_europe;
CREATE TABLE q04_airport_europe(
    airports int
); 


/* 
Your code here
*/
INSERT INTO q04_airport_europe

SELECT SUM(airport)
FROM (
    SELECT COUNT(timezone) AS "airport" FROM airline.airport
    GROUP BY timezone
    HAVING timezone LIKE '%Europe%'
    ) AS Europe_Airport;