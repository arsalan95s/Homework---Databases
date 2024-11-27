--1
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS bill_count
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 2;

--2
SELECT room_name, COUNT(*) AS tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

--3
SELECT t.room_name, SUM(b.bill_total) AS total
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
GROUP BY t.room_name;

--4
SELECT 
    h.first_name AS headwaiter_first_name,
    h.surname AS headwaiter_surname,
    SUM(b.bill_total) AS total_bill_amount
FROM restStaff h
JOIN restStaff w ON w.headwaiter = h.staff_no
JOIN restBill b ON b.waiter_no = w.staff_no
GROUP BY h.staff_no, h.first_name, h.surname
ORDER BY total_bill_amount DESC;

--5
SELECT cust_name FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

--6
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS bill_count
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 3
ORDER BY bill_count DESC, b.bill_date;


