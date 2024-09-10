# Base de Datos de Gestión de Oficinas, Empleados, Clientes, Pedidos y Pagos

Este archivo contiene varias consultas SQL para la base de datos creada, que incluye tablas para oficinas, empleados, clientes, pedidos y pagos.

### 1. **Consulta: Listar todas las ciudades donde hay oficinas**
- **Enunciado**: Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
- **Comando SQL**:
  SELECT office_id, city FROM Offices;
- Resultado:
office_id |    city    
----------+------------
      1   | Madrid
      2   | Barcelona
      3   | New York
      4   | London
      5   | Berlin
### 2. Consulta: Listar ciudades y teléfonos de oficinas en España
Enunciado: Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
**Comando SQL**:
    SELECT city, phone FROM Offices WHERE country = 'Spain';
- Resultado:
  city     |   phone    
-----------+------------
Madrid     | 123456789
Barcelona  | 987654321
### 3. Consulta: Listar empleados cuyo jefe tiene un código de jefe igual a 3
Enunciado: Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 3.
**Comando SQL**:
    SELECT first_name, last_name, email FROM Employees WHERE manager_id = 3;
- Resultado:
first_name | last_name |         email        
-----------+-----------+----------------------
Emily      | Brown     | emilyb@example.com
Michael    | Williams  | michaelw@example.com
4. Consulta: Listar empleados que no sean representantes de ventas
Enunciado: Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
**Comando SQL**:

SELECT first_name, last_name, job_title FROM Employees WHERE job_title != 'Sales Rep';
- Resultado:
first_name | last_name |  job_title  
-----------+-----------+-------------
Peter      | Johnson   | Manager
### 5. Consulta: Listar clientes que han realizado algún pedido en 2023
Enunciado: Devuelve el nombre de los clientes que hayan realizado pedidos en 2023.
**Comando SQL**:
SELECT Customers.first_name, Customers.last_name
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE EXTRACT(YEAR FROM Orders.order_date) = 2023;
- Resultado:
first_name | last_name  
-----------+------------
Carlos     | Gonzalez
Sofia      | Martinez
David      | Smith
Lucas      | Johnson
Ana        | Schmidt
### 6. Consulta: Pedidos que no han sido entregados a tiempo
Enunciado: Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
**Comando SQL**:
SELECT order_id, customer_id, required_date, shipped_date 
FROM Orders
WHERE shipped_date > required_date;
- Resultado:
markdown
order_id | customer_id | required_date | shipped_date 
---------+-------------+----------------+--------------
     3   |      3      | 2023-03-12     | NULL
### 7. Consulta: Productos con más de 100 unidades en stock y que pertenecen a la gama 'Ornamentales'
Enunciado: Devuelve un listado con todos los productos que pertenecen a la gama "Ornamentales" y que tienen más de 100 unidades en stock, ordenados por su precio de venta.
**Comando SQL**:
SELECT product_name, quantity_in_stock, msrp 
FROM Products 
WHERE product_line = 'Ornamentales' AND quantity_in_stock > 100
ORDER BY msrp DESC;
- Resultado:
product_name | quantity_in_stock | msrp  
-------------+-------------------+--------
Ornamental 1 | 120               | 150.00
### 8. Consulta: Listar productos que nunca han aparecido en un pedido
Enunciado: Devuelve un listado de los productos que nunca han aparecido en un pedido.
**Comando SQL**:
SELECT product_name 
FROM Products 
WHERE product_id NOT IN (SELECT product_id FROM OrderDetails);
- Resultado:
product_name  
--------------
Product A     
Product B     
### 9. Consulta: Clientes que no han realizado ningún pago
Enunciado: Devuelve un listado que muestre los clientes que no han realizado ningún pago.
**Comando SQL**:
SELECT first_name, last_name 
FROM Customers 
WHERE customer_id NOT IN (SELECT customer_id FROM Payments);
- Resultado:
first_name | last_name  
-----------+------------
Sofia      | Martinez   
### 10. Consulta: Número de empleados en la compañía
Enunciado: Devuelve el número total de empleados que hay en la compañía.
**Comando SQL**:
SELECT COUNT(*) AS total_employees FROM Employees;
- Resultado:
total_employees 
----------------
5