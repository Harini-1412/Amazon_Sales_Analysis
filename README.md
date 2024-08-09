**Amazon Sales Data Analysis**

**Project Overview**
The aim of this capstone project is to gain insights into the sales data of Amazon branches located in Mandalay, Yangon, and Naypyitaw. By analyzing this data, we seek to understand the factors influencing sales across these branches, evaluate the performance of different product lines, and uncover customer behavior patterns.

**Dataset**
The dataset used for this project contains sales transactions from three Amazon branches. It includes 17 columns and 1000 rows:

Columns
invoice_id - Invoice of the sales made	VARCHAR(30)
branch -	Branch at which sales were made	VARCHAR(5)
city	- The location of the branch	VARCHAR(30)
customer_type - 	The type of the customer	VARCHAR(30)
gender - 	Gender of the customer making purchase	VARCHAR(10)
product_line - 	Product line of the product sold	VARCHAR(100)
unit_price - 	The price of each product	DECIMAL(10, 2)
quantity - 	The amount of the product sold	INT
VAT - 	The amount of tax on the purchase	FLOAT(6, 4)
total	- The total cost of the purchase	DECIMAL(10, 2)
date - The date on which the purchase was made	DATE
time - 	The time at which the purchase was made	TIMESTAMP
payment_method - 	The total amount paid	DECIMAL(10, 2)
cogs - 	Cost Of Goods sold	DECIMAL(10, 2)
gross_margin_percentage - 	Gross margin percentage	FLOAT(11, 9)
gross_income - 	Gross Income	DECIMAL(10, 2)
rating - 	Rating	FLOAT(2, 1)

**Analysis Objectives**
- Product Analysis
      Analyze different product lines to identify the best-performing lines and those needing improvement.
- Sales Analysis
      Assess sales trends to evaluate the effectiveness of sales strategies and suggest modifications to boost sales.
- Customer Analysis
      Uncover customer segments, purchasing trends, and the profitability of each segment.
  
**Approach**
- Data Wrangling
     1.Created a database and tables.
     2.Inserted and validated data, ensuring no NULL values were present.

- Feature Engineering
     Added new columns to enhance analysis:
                -timeofday: Indicates sales in Morning, Afternoon, and Evening.
                -dayname: Extracted day of the week from transaction date.
                -monthname: Extracted month from transaction date.
  
- Exploratory Data Analysis (EDA)
      Addressed key business questions including:
            -Count of distinct cities and product lines.
            -Most frequent payment methods and product lines with highest sales.
            -Monthly revenue and peak COGS.
            -Revenue and VAT analysis by city.
            -Customer type and gender analysis.
            -Rating analysis by time of day and day of the week.
  
**Key Visualizations**
The project includes visualizations created using Power BI, which provide key insights into the data. The Power BI file (Amazon Sales Insights.pbix) is included in this repository.

**Files**
-Sales_Insights_queries: SQL scripts for data processing and analysis.
-Amazon Sales Insights.pbix: Power BI file with key visualizations and insights.
-README.md: Documentation for the project.
