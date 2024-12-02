--1
CREATE VIEW samsBills 
AS SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restBill
JOIN restStaff 
ON staff_no = waiter_no
WHERE first_name = 'Sam' AND surname = 'Pitt';

--2
SELECT * FROM samsBills
WHERE bill_total > 400;

--3
CREATE VIEW roomTotals (room_name, total_sum)
AS SELECT room_name, SUM(bill_total)
FROM restBill
JOIN restRest_table
ON restBill.table_no = restRest_table.table_no
GROUP BY room_name;

--4
CREATE VIEW teamTotals (headwaiter_name, total_sum)
AS SELECT CONCAT(b.first_name, ' ',b.surname), SUM(bill_total)
FROM restBill
JOIN restStaff b ON a.staff_no = restBill.waiter_no
JOIN restStaff a ON a.headwaiter = b.waiter_no
GROUP BY b.staff_no, b.first_name, b.surname;