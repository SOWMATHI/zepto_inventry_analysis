drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightINGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);
--sku stock keeping units id

--1.data exploration

--count of rows 
SELECT COUNT(*) FROM zepto;
--result:3732

--sample data
SELECT * FROM Zepto
LIMIT 10;

--null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR 
mrp IS NULL
OR
discountPercent IS NULL
OR 
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR 
availableQuantity IS NULL
OR
outOfStock IS NULL
OR 
quantity IS NULL
--Result : There is no NULL Values

--different product categories
SELECT distinct category
FROM zepto
ORDER BY category;

--products in stock vs out of stock 
SELECT outOfStock,COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;
--result false 3279 true 453

--product names present multiple times
SELECT name,COUNT(sku_id) as "Number of SKUs"
from zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY count(sku_id) DESC;

--2.data cleaning

--products with price = 0
SELECT * FROM zepto
WHERE mrp =0 OR discountedSellingPrice = 0;
--id :3607 Home & Cleaning mrp is 0.00 
--It is impossible, so we have to delete this row

DELETE FROM zepto
WHERE mrp=0;


--1Kg of onion is showing 2500 ,1KG of onion cannot be 2500
--so mrp is in paise not in rupees ,

--converting paise into rupees
UPDATE zepto 
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp,discountedSellingPrice FROM zepto;

--1.Find the top 10 best-value products based on discount percentage
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;
--It is usefull that which is heavily promoted with discounts

--2.Find products with high MRP but out of stock
SELECT DISTINCT name, mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;

--3.Calculate estimated revenue for each category
SELECT category,
SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--4.Find products where MRP is greater than ₹500 
--and discount is less than 10%
SELECT Distinct name,mrp,discountPercent
FROM Zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

--5.Find the top 5 categories offering 
--the highest average discount percentage
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

--6.Find the price per gram 
--for products above 100 g and sort by best value
SELECT Distinct name , weightINGms, discountedSellingprice,
ROUND(discountedSellingPrice / weightInGms ,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;
--used for pricing strategies

--7.Group products into categories like Low, Medium and Bulk
SELECT DISTINCT name,weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
     WHEN weightInGms < 5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;

--8.Find the total inventory weight per category
--which contributes most overall inventry weight,helpfull for warehouse planning
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;

