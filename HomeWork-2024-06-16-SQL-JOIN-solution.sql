/* b) Use table "orders" and table "customers" */
/*   i) Show orderDate, shippedDate, status and customerName
     ii) Get only those where status is "shipped" and order them 
         by shippedDate from the recent backwards.
     iii) Instead of ii) get only those where status is not shipped
          and order them by status and by customerName
     iv) Add to the previous condition to get only the orders that their
         orderDate is in the range from 2004-05-07 till 2005-01-12
         including
*/ 

-- i)

SELECT orderDate, shippedDate, status, customerName
FROM orders o JOIN customers c
     ON o.customerNumber = c.customerNumber;

--   ii)

SELECT orderDate, shippedDate, status, customerName
FROM orders o JOIN customers c
     ON o.customerNumber = c.customerNumber
WHERE status = 'shipped'
ORDER BY shippedDate DESC;

--   iii)

SELECT orderDate, shippedDate, status, customerName
FROM orders o JOIN customers c
     ON o.customerNumber = c.customerNumber
WHERE status != 'shipped'
ORDER BY status, customerName;

--  iv)

SELECT orderDate, shippedDate, status, customerName
FROM orders o JOIN customers c
     ON o.customerNumber = c.customerNumber
WHERE status != 'shipped' AND 
     orderDate BETWEEN '2004-05-07' AND '2005-01-12'
ORDER BY status, customerName;

/* c) Use table "orders" and table "orderDetails" 
   i) show orderDate, shippedDate, status, customerNumber, productCode, quantityOrdered, priceEach
        and order by orderNumber
     ii) add column that is a result of multiplication of quantityOrdered by priceEach,
         rounded to zero digits after a dot, and give it a name "total"
     iii) inside each order set the rows from the biggest to the smallest "total"
     iv) and show only the rows for wich the above calculation result is greater or
         equal to 3223 and smaller than 3232
     v) instead of iv) show only the rows that in their productCode have after "S"
        and before "underscore" number that is 700 or 25 or 50 or 32 or 72 - 
        use for this the functions SUBSTRING() and INSTR()
     vi) and that their price is in the range from 60.9 to 65.15 including
     vii) and that the number after "underscore" in their productCode is bigger or equal to 2000
          (use INSTR and SUBSTRING) */

-- i)

SELECT orderDate, shippedDate, status, customerNumber, productCode, quantityOrdered, priceEach
FROM orders o JOIN orderDetails od
     ON o.orderNumber = od.orderNumber
ORDER BY o.orderNumber;

--   ii)

SELECT orderDate, shippedDate, status, customerNumber, productCode, quantityOrdered, priceEach,
       ROUND(quantityOrdered * priceEach,0) AS total
FROM orders o JOIN orderDetails od
     ON o.orderNumber = od.orderNumber
ORDER BY o.orderNumber;

--   iii)
SELECT orderDate, shippedDate, status, customerNumber, productCode, quantityOrdered, priceEach,
       ROUND(quantityOrdered * priceEach,0) AS total
FROM orders o JOIN orderDetails od
     ON o.orderNumber = od.orderNumber
ORDER BY o.orderNumber, total DESC;

--  iv)
SELECT orderDate, shippedDate, status, customerNumber, productCode, quantityOrdered, priceEach,
       ROUND(quantityOrdered * priceEach,0) AS total
FROM orders o JOIN orderDetails od
     ON o.orderNumber = od.orderNumber
WHERE ROUND(quantityOrdered * priceEach,0) >=3223 AND ROUND(quantityOrdered * priceEach, 0) < 3232
ORDER BY o.orderNumber, total DESC;

--   v)
SELECT orderDate, shippedDate, status, customerNumber, productCode, quantityOrdered, priceEach,
       ROUND(quantityOrdered * priceEach,0) AS total
FROM orders o JOIN orderDetails od
     ON o.orderNumber = od.orderNumber
WHERE SUBSTRING(productCode,2,INSTR(productCode,'_')-2) IN (700, 25, 50, 32, 72)
ORDER BY o.orderNumber, total DESC;

--   vi)
SELECT orderDate, shippedDate, status, customerNumber, productCode, quantityOrdered, priceEach,
       ROUND(quantityOrdered * priceEach,0) AS total
FROM orders o JOIN orderDetails od
     ON o.orderNumber = od.orderNumber
WHERE SUBSTRING(productCode,2,INSTR(productCode,'_')-2) IN (700, 25, 50, 32, 72)
     AND priceEach BETWEEN 60.9 and 65.15
ORDER BY o.orderNumber, total DESC;

--   vii)

SELECT orderDate, shippedDate, status, customerNumber, productCode, quantityOrdered, priceEach,
       ROUND(quantityOrdered * priceEach,0) AS total
FROM orders o JOIN orderDetails od
     ON o.orderNumber = od.orderNumber
WHERE SUBSTRING(productCode,2,INSTR(productCode,'_')+1) IN (700, 25, 50, 32, 72)
     AND priceEach BETWEEN 60.9 and 65.15 
     AND SUBSTRING(productCode,INSTR(productCode,'_')+1) >=2000
ORDER BY o.orderNumber, total DESC;

/* d) Use table "customers" and table "employees" 
      i) show contactFirstName, contactLastName, and from "employees":
         concatenate with spaces firstName, lastName and jobTitle
         and call this column "full_name"

     ii) show only the rows where contactFirstName and sales representative 
         first name have the same first letter
*/

-- i)

SELECT contactFirstName, contactLastName, 
       CONCAT_WS(' ',e.firstName, e.lastName, e.jobTitle) full_name 
FROM customers c JOIN employees e
     ON c.salesRepEmployeeNumber = e.employeeNumber;

-- ii)

SELECT contactFirstName, contactLastName, 
       CONCAT_WS(' ',e.firstName, e.lastName, e.jobTitle) full_name 
FROM customers c JOIN employees e
     ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE SUBSTRING(contactFirstName,1,1) = SUBSTRING(firstName,1,1);