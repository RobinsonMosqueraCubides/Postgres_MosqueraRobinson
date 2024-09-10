CREATE TABLE Offices (
    office_id SERIAL PRIMARY KEY,
    city VARCHAR(100),
    phone VARCHAR(20),
    country VARCHAR(100)
);
CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    job_title VARCHAR(50),
    office_id INT,
    manager_id INT,
    FOREIGN KEY (office_id) REFERENCES Offices(office_id),
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(100),
    country VARCHAR(100),
    phone VARCHAR(20),
    sales_rep_id INT,
    FOREIGN KEY (sales_rep_id) REFERENCES Employees(employee_id)
);
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    status VARCHAR(50),
    comments TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    customer_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    product_line VARCHAR(100),
    product_scale VARCHAR(50),
    product_vendor VARCHAR(100),
    quantity_in_stock INT,
    buy_price DECIMAL(10, 2),
    msrp DECIMAL(10, 2)
);
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity_ordered INT,
    price_each DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
