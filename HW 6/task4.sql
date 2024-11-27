--1
SELECT cust_name
FROM restBill
INNER JOIN restStaff
ON waiter_no = staff_no
WHERE (bill_total > 450.00) AND headwaiter = (SELECT staff_no FROM restStaff WHERE first_name = 'Charles');

--2 ?
SELECT first_name, surname 
FROM restStaff
INNER JOIN restBill
ON waiter_no = headwaiter
WHERE cust_name LIKE 'Nerida%' AND bill_date = '160111';

--3
SELECT cust_name 
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

--4 
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill WHERE waiter_no IS NOT NULL)
AND headwaiter IS NOT NULL;

--5
SELECT 
    cust_name, 
    (SELECT first_name FROM restStaff WHERE staff_no = headwaiter) AS headwaiter_first_name,
    (SELECT surname FROM restStaff WHERE staff_no = headwaiter) AS headwaiter_surname,
    (SELECT room_name FROM restRest_table WHERE table_no = b.table_no) AS room_name
FROM restBill b
WHERE bill_total = (SELECT MAX(bill_total) FROM restBill);
