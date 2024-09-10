INSERT INTO Offices (city, phone, country) VALUES
('Madrid', '123456789', 'Spain'),
('Barcelona', '987654321', 'Spain'),
('New York', '555123456', 'USA'),
('London', '444123456', 'UK'),
('Berlin', '333123456', 'Germany');
INSERT INTO Employees (first_name, last_name, email, job_title, office_id, manager_id) VALUES
('John', 'Doe', 'johndoe@example.com', 'Sales Rep', 1, NULL),
('Jane', 'Smith', 'janesmith@example.com', 'Sales Rep', 2, NULL),
('Peter', 'Johnson', 'peterj@example.com', 'Manager', 3, NULL),
('Emily', 'Brown', 'emilyb@example.com', 'Sales Rep', 1, 3),
('Michael', 'Williams', 'michaelw@example.com', 'Sales Rep', 4, 3);
INSERT INTO Customers (first_name, last_name, city, country, phone, sales_rep_id) VALUES
('Carlos', 'Gonzalez', 'Madrid', 'Spain', '600123456', 1),
('Sofia', 'Martinez', 'Barcelona', 'Spain', '610123456', 2),
('David', 'Smith', 'New York', 'USA', '620123456', 3),
('Lucas', 'Johnson', 'London', 'UK', '630123456', 4),
('Ana', 'Schmidt', 'Berlin', 'Germany', '640123456', 5);
INSERT INTO Orders (customer_id, order_date, required_date, shipped_date, status, comments) VALUES
(1, '2023-01-10', '2023-01-15', '2023-01-14', 'Shipped', 'Delivered on time'),
(2, '2023-02-12', '2023-02-20', '2023-02-18', 'Shipped', 'Delivered two days early'),
(3, '2023-03-05', '2023-03-12', NULL, 'Pending', 'Delayed due to customs'),
(4, '2023-04-18', '2023-04-25', '2023-04-24', 'Shipped', 'No issues'),
(5, '2023-05-22', '2023-05-30', '2023-05-29', 'Shipped', 'Delivered on time');
INSERT INTO Payments (customer_id, payment_date, amount, payment_method) VALUES
(1, '2023-01-14', 250.00, 'Credit Card'),
(2, '2023-02-18', 150.00, 'Paypal'),
(3, '2023-03-15', 320.50, 'Bank Transfer'),
(4, '2023-04-26', 500.00, 'Credit Card'),
(5, '2023-05-29', 75.20, 'Credit Card');
