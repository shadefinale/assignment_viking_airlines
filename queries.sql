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