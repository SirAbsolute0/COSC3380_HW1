/*
Q19:
detective question
we do not know first name
show departure city of flights for passengers whose last name is FROLOV
*/

DROP TABLE q19_frolov;
CREATE TABLE q19_frolov(
   city character(20)
);

/* Your code here */
INSERT INTO q19_frolov

SELECT DISTINCT city FROM airline.ticket AS ticket
JOIN airline.ticket_flight AS ticket_flight
   ON ticket.ticket_no = ticket_flight.ticket_no
JOIN airline.flight AS flight
   ON ticket_flight.flight_id = flight.flight_id
JOIN airline.airport AS airport
   ON flight.departure_airport = airport.airport_code
WHERE passenger_name LIKE '%FROLOV';