-- Get a list of all users in California

SELECT *
FROM users
WHERE state_id = 5

-- Get a list of all airports in Minnesota

SELECT *
 FROM airports
 JOIN states ON state_id = states.id
 WHERE states.name = 'Minnesota'

 -- Get a list of all payment methods used on itineraries by the user with email address "heidenreich_kara@kunde.net"

SELECT payment_method FROM itineraries
JOIN users ON user_id = users.id
WHERE users.email = 'heidenreich_kara@kunde.net'

-- Get a list of prices of all flights whose origins are in Kochfurt Probably International Airport.

SELECT price FROM airports
JOIN flights ON origin_id = airports.id
WHERE airports.long_name = 'Kochfurt Probably International Airport'

-- Find a list of all Airport names and codes which connect to the airport coded LYT.

SELECT airports.long_name, airports.code
FROM airports a JOIN flights ON flights.origin_id = airports.id OR flights.destination_id = airports.id
  JOIN airlines airline ON (a.code = airline.id)
WHERE (destination_id = 392 OR origin_id = 392) and airports.id != 392

-- Find a list of all Airport names and codes which connect to the airport coded LYT.

SELECT long_name, code
FROM airports JOIN Flights ON (origin_id = airports.id or destination_id = airports.id)
WHERE (flights.origin_id = (SELECT id FROM airports WHERE code = 'LYT')
	or flights.destination_id = (SELECT id FROM airports WHERE code = 'LYT'))
    AND airports.code != 'LYT')

-- Get a list of all airports visited by user Danny D'Amore after January 1, 2015. (Hint, see if you can get a list of all ticket IDs first)

USERS -> itineraries -> Tickets -> flights -> airports

SELECT airports.long_name, flights.departure_time
FROM users JOIN itineraries ON (users.id = itineraries.user_id)
           JOIN tickets ON (tickets.itinerary_id = itineraries.id)
           JOIN flights ON (tickets.flight_id = flights.id)
           JOIN airports ON (flights.origin_id = airports.id OR
                             flights.destination_id = airports.id)
WHERE users.first_name ilike 'Dannie' AND users.last_name ilike 'D''Amore' AND flights.departure_time > '2012-1-1'