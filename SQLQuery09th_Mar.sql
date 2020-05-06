SELECT * FROM Customers;

SELECT * FROM Orders;
dfgdfgdfg
SELECT * FROM Subscribers;

/*
SELECT  Market,
COUNT(CASE WHEN IsActive = '1' THEN 1 END) as Existing, 
COUNT(CASE WHEN IsActive = '0' THEN 1 END) as Old ,
COUNT(*) AS Total_Count
FROM Subscribers
GROUP BY Market;
NT(*) AS TotalNo FROM subscribers WHERE YEAR(StartDate) = YEAR(StopDate);

/* 9th Question */

SELECT YEAR(StartDate) AS Year, COUNT(SubscriberId) AS Subscribers ,DATEDIFF(YEAR, StartDate, StopDate) AS Date_Difference FROM subscribers
WHERE DATEDIFF(YEAR, StartDate, StopDate) IS NOT NULL GROUP BY YEAR(StartDate), DATEDIFF(YEAR, StartDate, StopDate) ORDER BY DATEDIFF(YEAR, StartDate, StopDate) DESC;

/* 10th Question */

SELECT datename(month,try_convert(date,orderdate)) AS Month_A,sum((try_convert(int,totalprice) * try_convert(int,numunits))) AS Total_Amount
FROM Orders
GROUP BY datename(month,try_convert(date,orderdate))
ORDER BY Total_Amount DESC;




