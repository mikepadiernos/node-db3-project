-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName,
       c.CategoryName
FROM [Product] as p
         JOIN [Category] as c
              ON p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id,
       c.CompanyName
FROM [Order] as o
         JOIN [Customer] as c
              ON o.CustomerId = c.Id
WHERE o.OrderDate < '2012-08-09'
ORDER BY o.OrderDate DESC;

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName,
       o.Quantity
FROM [OrderDetail] as o
         JOIN [Product] as p
              ON p.Id = o.ProductId
WHERE o.OrderId = 10251
ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT d.OrderId,
       c.CompanyName as "Company",
       e.LastName as "Employee's Surname"
FROM [Order] as o
         JOIN [OrderDetail] as d
         JOIN [Customer] as c
         JOIN [Employee] as e
WHERE o.Id = d.OrderId
  AND o.EmployeeId = e.Id
  AND o.CustomerId = c.Id
GROUP BY o.Id