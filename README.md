# SQL Superstore Sales Analysis

## Project Overview

This project demonstrates SQL-based data analysis using the Sample Superstore dataset. The dataset was imported into a SQLite database, normalized into separate tables, and analyzed using SQL queries to extract meaningful business insights.

The project focuses on customer behavior, product performance, sales trends, and profitability using SQL concepts such as joins, subqueries, Common Table Expressions (CTEs), and window functions.

---

## Objectives

- Import CSV data into a SQLite database.
- Normalize the dataset into Customers, Products, and Orders tables.
- Perform business-oriented SQL analysis.
- Apply advanced SQL concepts including:
  - Subqueries
  - Joins
  - Common Table Expressions (CTEs)
  - Window Functions
  - Aggregate Functions
- Generate actionable business insights from the data.

---

## Technologies Used

- Python
- Jupyter Notebook
- Pandas
- SQLite
- SQL

---

## Dataset

**Dataset:** Sample Superstore

The dataset contains information related to:

- Customers
- Products
- Orders
- Sales
- Profit
- Discounts
- Categories
- Shipping Details

---

## Database Structure

The dataset was normalized into the following tables:

### Customers
- Customer ID
- Customer Name
- Segment
- Country
- State
- City

### Products
- Product ID
- Product Name
- Category
- Sub-Category

### Orders
- Order ID
- Order Date
- Ship Date
- Ship Mode
- Customer ID
- Product ID
- Sales
- Quantity
- Discount
- Profit

---

## SQL Concepts Demonstrated

- Data Import
- Table Creation
- Data Normalization
- Aggregate Functions
- GROUP BY
- ORDER BY
- Subqueries
- INNER JOIN
- Common Table Expressions (CTEs)
- ROW_NUMBER()
- RANK()
- Filtering with HAVING
- Business Analytics Queries

---

## Business Questions Answered

- Which orders have above-average sales?
- Which customers placed only one order?
- What is the highest-value order for each customer?
- Who are the top customers based on total sales?
- Which products generate the highest sales?
- Which orders resulted in losses?
- Which product categories contribute the highest revenue?
- How can customers be ranked based on their purchases?

---

## Key Insights

- High-value orders contribute significantly to total revenue.
- A small group of customers generates a large share of sales.
- Some transactions result in negative profit despite generating sales.
- Product categories perform differently in terms of revenue.
- Ranking customers helps identify valuable buyers for targeted marketing.

---

## Project Files

```
SQL-Superstore-Analysis/
│
├── data/
│   └── Sample - Superstore.csv
│
├── notebook.ipynb
├── SQL_ANALYSIS.sql
├── README.md
└── requirements.txt
```

---

## How to Run the Project

1. Clone the repository.

```
git clone <repository-url>
```

2. Install the required libraries.

```
pip install -r requirements.txt
```

3. Open Jupyter Notebook.

```
jupyter notebook
```

4. Open `notebook.ipynb`.

5. Run all cells sequentially.

---

## Learning Outcomes

This project strengthened practical knowledge of:

- SQL Query Writing
- Database Normalization
- Data Analysis using SQL
- Customer and Product Analytics
- Business Intelligence Reporting
- Python-SQL Integration

---

## Conclusion

This project demonstrates how SQL can be used to transform raw transactional data into meaningful business insights. By combining SQL queries with Python and SQLite, the analysis identifies customer purchasing behavior, product performance, and revenue trends that can support informed business decisions.
