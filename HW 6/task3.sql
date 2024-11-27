--1
SELECT DISTINCT first_name, surname FROM restStaff
JOIN restbill ON staff_no = waiter_no
WHERE cust_name = 'Tanya Singh';

--2
SELECT room_date FROM restRoom_management a
INNER JOIN restStaff b
ON a.headwaiter = b.staff_no
WHERE first_name = 'Charles' AND room_name = 'Green' AND room_date LIKE '1602%';

--3
SELECT s2.first_name, s2.surname
FROM restStaff s1
JOIN restStaff s2 ON s1.headwaiter = s2.headwaiter
WHERE s1.first_name = 'Zoe' AND s1.surname = 'Ball';

--4
SELECT cust_name, bill_total, first_name, surname
FROM restbill
INNER JOIN restStaff
ON waiter_no = staff_no
ORDER BY bill_total DESC; 

--5
SELECT DISTINCT first_name, surname 
FROM restStaff
INNER JOIN restbill
ON staff_no = waiter_no
WHERE staff_no IN (
        SELECT waiter_no 
        FROM restBill 
        WHERE bill_no IN ('00014', '00017')
    );

--6
SELECT first_name, surname 
FROM restStaff a
INNER JOIN restRoom_management b
ON a.headwaiter = b.headwaiter OR a.staff_no = b.headwaiter
WHERE room_name = 'Blue' AND room_date = '160312';




