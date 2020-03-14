/* How many packages was delivered */

SELECT COUNT(*) FROM packages
WHERE packages.delivered

/*What are the packages need to be delivered and received in January 2020*/
SELECT packages.from_cust, packages.to_cust, process.receive_date
FROM packages
JOIN process ON packages.pack_id = process.pack_id
WHERE packages.delivered = 0
AND process.receive_date BETWEEN '2020-01-01' and '2020-01-31';


/* Show all tracking of package from "James" */

SELECT packages.pack_id as TrackingNumber, tracks.depo_date,tracks.send_date, departments.name, departments.city
FROM packages
JOIN tracks ON packages.pack_id = tracks.pack_id
JOIN departments ON tracks.dep_num = departments.dep_num
WHERE packages.from_cust = 'James'
ORDER BY tracks.depo_date

/* how many packages were sent from Vienna */
SELECT COUNT(packages.pack_id)
FROM packages
JOIN tracks ON packages.pack_id = tracks.pack_id
JOIN departments ON tracks.dep_num = departments.dep_num
WHERE departments.city = 'Vienna'
/* how many packages are in Vienna now and what are these packages*/
SELECT COUNT(*)
FROM tracks
JOIN departments ON tracks.dep_num = departments.dep_num
WHERE departments.city = 'Vienna' AND tracks.send_date = 0;
SELECT tracks.pack_id, tracks.depo_date, departments.name
FROM tracks
JOIN departments ON tracks.dep_num = departments.dep_num
WHERE departments.city = 'Vienna' AND tracks.send_date = 0;

/*who sent packages on 2020-01-16*/
SELECT packages.from_cust
FROM packages
JOIN process ON packages.pack_id = process.pack_id
WHERE process.receive_date = '2020-01-16'

/*who sent packages in 2020*/
SELECT packages.from_cust
FROM packages
JOIN process ON packages.pack_id = process.pack_id
WHERE process.receive_date BETWEEN '2020-01-01' AND '2020-12-31'

/*who sent packages in Vienna in January and February, which department receive the package and which employee*/
SELECT packages.from_cust, process.receive_date, employees.first_name, employees.last_name, departments.name as in_Department
FROM packages
JOIN process ON packages.pack_id = process.pack_id
JOIN employees ON process.emp_num = employees.emp_num
JOIN empl_depart ON employees.emp_num = empl_depart.emp_num
JOIN departments ON empl_depart.dep_num = departments.dep_num
WHERE departments.city = 'Vienna'
AND process.receive_date BETWEEN '2020-01-01' AND '2020-03-01'
GROUP BY packages.pack_id