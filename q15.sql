/* 
Q15: 
  show passenger name, flight_id,scheduled departure date/time
     , departing airport,arrival airport
  for delayed flights arriving in Moscow departing from any airport
Write your query and store the result.
*/

DROP TABLE q15_delayed_moscow;
CREATE TABLE q15_delayed_moscow(
    passenger_name character varying(20),
    flight_id int,
    scheduled_departure timestamptz,
    departure_airport character(3),
    arrival_airport character(3) 
    
); 


/* 
Your code here
*/
INSERT INTO q15_delayed_moscow

SELECT passenger_name, ticket_flight.flight_id, scheduled_departure, departure_airport, arrival_airport
FROM airline.ticket_flight AS ticket_flight
JOIN airline.ticket AS ticket
  ON ticket_flight.ticket_no = ticket.ticket_no
JOIN airline.flight AS flight
  ON ticket_flight.flight_id = flight.flight_id
WHERE (arrival_airport = 'SVO' OR arrival_airport = 'VKO' OR arrival_airport = 'DME') AND (status = 'Delayed')
GROUP BY arrival_airport, passenger_name, ticket_flight.flight_id, scheduled_departure, departure_airport;