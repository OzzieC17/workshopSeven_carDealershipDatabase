SELECT * FROM dealerships;
SELECT v.* 
FROM inventory i
JOIN vehicles v ON i.VIN = v.VIN
WHERE i.dealership_id = 1;
SELECT * FROM vehicles
WHERE VIN = '1FA6P8TH5L5100001';
SELECT DISTINCT d.*
FROM inventory i
JOIN vehicles v ON i.VIN = v.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE v.make = 'Ford'
	AND v.model = 'Mustang'
    AND v.color = 'Red';
SELECT * FROM sales_contracts
WHERE dealership_id = 2
	AND sales_date BETWEEN '2025-01-01' AND '2025-12-31';