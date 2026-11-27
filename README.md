# Zepto Inventory Analysis using PostgreSQL

## Project Overview

This project focuses on analysing Zepto's inventory dataset using PostgreSQL. The objective is to explore product pricing, discounts, stock availability, and inventory weight to generate useful business insights.

The project demonstrates SQL skills such as data exploration, data cleaning, aggregation, filtering, and business analysis.

## Business Problem

A retail business needs to understand its inventory and product pricing to make better business decisions.

This project aims to answer questions such as:

- Which products offer the highest discounts?
- Which high-priced products are currently out of stock?
- Which categories have the highest estimated inventory value?
- Which categories offer the highest average discounts?
- What is the price per gram of different products?
- Which categories contribute the most to total inventory weight?

## Dataset

- **Source:** Kaggle
- **Dataset:** Zepto Inventory Dataset
- **File used:** `zepto_v2.csv`
- **Database:** PostgreSQL

The dataset contains product and inventory-related information.

### Dataset Columns

| Column | Description |
|---|---|
| `sku_id` | Unique product identifier created in PostgreSQL |
| `category` | Product category |
| `name` | Product name |
| `mrp` | Maximum Retail Price |
| `discountPercent` | Discount percentage |
| `availableQuantity` | Available stock quantity |
| `discountedSellingPrice` | Selling price after discount |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Stock availability status |
| `quantity` | Product quantity |

## Tools and Technologies

- PostgreSQL
- pgAdmin 4
- SQL
- Kaggle Dataset

## Project Workflow

### 1. Database and Table Creation

- Created a PostgreSQL database named `zepto_SQL_project`.
- Created a table named `zepto`.
- Defined appropriate data types for each column.
- Added `sku_id` as a primary key using `SERIAL`.

### 2. Data Import

- Imported the Kaggle CSV dataset into PostgreSQL using pgAdmin.
- Configured CSV format, UTF-8 encoding, comma delimiter, and header settings.

### 3. Data Exploration

Performed the following analysis:

- Counted total records.
- Viewed sample data.
- Checked for NULL values.
- Identified distinct product categories.
- Analysed in-stock and out-of-stock products.
- Identified product names appearing multiple times.

### 4. Data Cleaning

- Identified products with zero MRP.
- Removed the zero-MRP record based on the project's pricing validation rule.
- Converted MRP and discounted selling price from paise to rupees.

### 5. Business Analysis using SQL

Developed SQL queries to answer the following business questions:

1. Find the top 10 best-value products based on discount percentage.
2. Find products with high MRP but out of stock.
3. Calculate estimated inventory value for each category.
4. Find products where MRP is greater than ₹500 and discount is less than 10%.
5. Find the top 5 categories offering the highest average discount percentage.
6. Calculate price per gram for products above 100 grams.
7. Group products into Low, Medium, and Bulk weight categories.
8. Calculate total inventory weight per category.

## Key SQL Concepts Used

- SELECT
- WHERE
- DISTINCT
- ORDER BY
- LIMIT
- GROUP BY
- HAVING
- COUNT()
- SUM()
- AVG()
- ROUND()
- CASE WHEN
- DELETE
- UPDATE
- Primary Key
- Data Types

## Business Insights

The project helps explore:

- Product discount patterns
- Stock availability
- High-MRP products that are out of stock
- Category-wise estimated inventory value
- Average discounts across categories
- Product pricing based on weight
- Category-wise inventory weight

**Note:** The estimated inventory value is calculated using discounted selling price multiplied by available quantity. It represents the estimated value of available inventory, not actual sales revenue.

## Project Files

```text
Zepto_Project/
│
├── archive/
│   ├── zepto_v1.xlsx
│   └── zepto_v2.csv
│
├── zepto_inventory_analysis.sql
│
├── README.md
```

## Learning Outcomes

Through this project, I gained practical experience in:

- Working with PostgreSQL databases
- Importing CSV datasets
- Performing data exploration and cleaning
- Writing SQL queries for business analysis
- Using aggregate functions and conditional logic
- Understanding inventory-related business metrics

## Author

B.Sc. Computer Science with Data Analytics

Aspiring Data Engineer | SQL | Python | PostgreSQL
