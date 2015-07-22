# assignmnent_viking_analytics


SELECT long_name, code FROM airports JOIN Flights ON (origin_id = airports.id or destination_id = airports.id) WHERE flights.origin_id = (SELECT id FROM airports WHERE code = 'LYT') xor flights.destination_id = (SELECT id FROM airports WHERE code = 'LYT')