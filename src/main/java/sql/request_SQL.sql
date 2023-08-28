SELECT 
    r.name,
    r.lastname,
    r.email,
    b.address AS building_address,
    a.number_of_rooms,
    a.area
FROM resident r
JOIN resident_ownership ro ON r.id = ro.resident_id
JOIN apartment a ON ro.apartment_id = a.id
JOIN building b ON a.building_id = b.id
WHERE r.car_access = 0
AND (
    SELECT COUNT(*) 
    FROM resident_ownership ro2 
    WHERE ro2.resident_id = r.id
) < 2;

