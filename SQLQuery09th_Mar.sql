SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Subscribers;

/* 1st Question */

SELECT * ,
CASE
    WHEN IsActive = 1 THEN 'Existing'
    ELSE 'Old'
END AS Current_Subscribers
FROM Subscribers;

SELECT COUNT(IsActive) AS Count_Sub FROM Subscribers GROUP BY IsActive;

/* 2nd Question */

SELECT  Market,
COUNT(CASE WHEN IsActive = '1' THEN 1 END) as Existing, 
COUNT(CASE WHEN IsActive = '0' THEN 1 END) as Old ,
COUNT(*) AS Total_Count
FROM Subscribers
GROUP BY Market;

/* 3rd Question */

SELECT COUNT(SubscriberId) AS Total_Sub FROM Subscribers WHERE YEAR(StartDate) > '2000'

/* 4th Question */

SELECT
COUNT(CASE WHEN YEAR(StartDate) < 2000 THEN 1 ELSE NULL END) AS "Before2000",
COUNT(CASE WHEN YEAR(StartDate) > 2000 THEN 1 ELSE NULL END) AS "After2000"
FROM subscribers;

/* 5th Question */

SELECT COUNT(*) AS TotalNo FROM subscribers WHERE YEAR(StartDate) = YEAR(StopDate);

/* 6th Question */

SELECT *  FROM subscribers WHERE StartDate > StopDate;

/* 7th Question */

SELECT Top 1 YEAR(OrderDate) AS Year, SUM(NumUnits) AS Total_Units FROM Orders GROUP BY  YEAR(OrderDate) ORDER BY SUM(NumUnits) DESC;

/* 8th Question */

SELECT FirstName, (SELECT MAX(NumUnits) FROM Orders) AS MaxnumunitsSold FROM Customers
WHERE CustomerId = (SELECT CustomerId FROM Orders WHERE NumUnits = ( SELECT MAX(NumUnits) FROM Orders));

/* 9th Question */

SELECT YEAR(StartDate) AS Year, COUNT(SubscriberId) AS Subscribers ,DATEDIFF(YEAR, StartDate, StopDate) AS Date_Difference FROM subscribers
WHERE DATEDIFF(YEAR, StartDate, StopDate) IS NOT NULL GROUP BY YEAR(StartDate), DATEDIFF(YEAR, StartDate, StopDate) ORDER BY DATEDIFF(YEAR, StartDate, StopDate) DESC;

/* 10th Question */

SELECT datename(month,try_convert(date,orderdate)) AS Month_A,sum((try_convert(int,totalprice) * try_convert(int,numunits))) AS Total_Amount
FROM Orders
GROUP BY datename(month,try_convert(date,orderdate))
ORDER BY Total_Amount DESC;




