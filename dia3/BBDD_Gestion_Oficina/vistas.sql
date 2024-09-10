CREATE VIEW OfficeDetails AS
SELECT office_id, city, phone, country
FROM Offices;

CREATE VIEW EmployeeWithManager AS
SELECT e.employee_id, e.first_name, e.last_name, e.job_title, m.first_name AS manager_first_name, m.last_name AS manager_last_name
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id;

CREATE VIEW CustomersWithSalesRep AS
SELECT c.customer_id, c.first_name AS customer_first_name, c.last_name AS customer_last_name, e.first_name AS sales_rep_first_name, e.last_name AS sales_rep_last_name
FROM Customers c
LEFT JOIN Employees e ON c.sales_rep_id = e.employee_id;

CREATE VIEW LateOrders AS
SELECT order_id, customer_id, order_date, required_date, shipped_date
FROM Orders
WHERE shipped_date > required_date;

CREATE VIEW Payments2023 AS
SELECT payment_id, customer_id, payment_date, amount, payment_method
FROM Payments
WHERE EXTRACT(YEAR FROM payment_date) = 2023;

CREATE VIEW ProductsInStock AS
SELECT product_id, product_name, quantity_in_stock, msrp
FROM Products
WHERE quantity_in_stock > 100;

CREATE VIEW CustomersWithoutPayments AS
SELECT c.customer_id, c.first_name, c.last_name
FROM Customers c
LEFT JOIN Payments p ON c.customer_id = p.customer_id
WHERE p.customer_id IS NULL;

CREATE VIEW EmployeesWithOffices AS
SELECT e.employee_id, e.first_name, e.last_name, o.city, o.country
FROM Employees e
LEFT JOIN Offices o ON e.office_id = o.office_id;

CREATE VIEW OrderDetailsWithProducts AS
SELECT od.order_id, od.product_id, p.product_name, od.quantity_ordered, od.price_each
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id;

CREATE VIEW OrdersIn2023 AS
SELECT order_id, customer_id, order_date, status
FROM Orders
WHERE EXTRACT(YEAR FROM order_date) = 2023;
