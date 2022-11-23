/* Q05: 
is there any aircraft model without any flight, 
i.e. an airplane that is not used at all on any flight; 
answer must be t (true) or f (false)
*/

DROP TABLE q05_no_flight;
CREATE TABLE q05_no_flight(
    noflight boolean
); 


/* 
Your code here
*/
INSERT INTO q05_no_flight

SELECT CASE WHEN EXISTS (
    SELECT model, aircraft.aircraft_code, COUNT(flight_no) FROM airline.aircraft AS aircraft
    LEFT JOIN airline.flight AS flight
        ON aircraft.aircraft_code = flight.aircraft_code
    GROUP BY model, aircraft.aircraft_code
)
THEN TRUE
ELSE FALSE
END;
