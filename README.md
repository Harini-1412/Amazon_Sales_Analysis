**Amazon Sales Data Analysis**

**Project Overview**
The aim of this project is to gain insights into the sales data of Amazon branches located in Mandalay, Yangon, and Naypyitaw. By analyzing this data, we seek to understand the factors influencing sales across these branches, evaluate the performance of different product lines, and uncover customer behavior patterns.

**Dataset**
The dataset used for this project contains sales transactions from three Amazon branches. It includes 17 columns and 1000 rows.

**Analysis Objectives**
- Product Analysis
      Analyze different product lines to identify the best-performing lines and those needing improvement.
- Sales Analysis
      Assess sales trends to evaluate the effectiveness of sales strategies and suggest modifications to boost sales.
- Customer Analysis
      Uncover customer segments, purchasing trends, and the profitability of each segment.
  
**Approach**
- Data Wrangling
     - Created a database and tables. 
     - Inserted and validated data, ensuring no NULL values were present.

- Feature Engineering
  
     Added new columns to enhance analysis:
                -  timeofday: Indicates sales in Morning, Afternoon, and Evening.
                -  dayname: Extracted day of the week from transaction date.
                -  monthname: Extracted month from transaction date.
  
- Exploratory Data Analysis (EDA)
      Addressed key business questions including:
            -  Count of distinct cities and product lines.
            -  Most frequent payment methods and product lines with highest sales.
            -  Monthly revenue and peak COGS.
            -  Revenue and VAT analysis by city.
            -  Customer type and gender analysis.
            -  Rating analysis by time of day and day of the week.
  
**Key Visualizations**
The project includes visualizations created using Power BI, which provide key insights into the data. The Power BI file (Amazon Sales Insights.pbix) is included in this repository.

**Files**
- Sales_Insights_queries: SQL scripts for data processing and analysis.
- Amazon Sales Insights.pbix: Power BI file with key visualizations and insights.
- README.md: Documentation for the project.
