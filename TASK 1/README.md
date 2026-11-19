# Data Analytics & Business Intelligence Internship - Task 1

**Company:** Maincrafts Technology  
**Internship Role:** Data Analytics & Business Intelligence Intern  
**Project:** Task 1 - Data Cleaning, Exploratory Data Analysis (EDA) & Basic Business Reporting  
**Dataset:** Superstore Sales Dataset (9,799 records, 4,922 orders)  

---

## 📌 Project Overview

This repository houses all deliverables for **Task 1** of the **Maincrafts Technology Data Analytics & Business Intelligence Internship**. The objective of this project is to build an end-to-end analytical workflow on raw retail transaction data:
1. **Data Cleaning & Transformation** in Microsoft Excel
2. **Exploratory Data Analysis (EDA)** using summary metrics and pivot tables
3. **Database Import & Aggregation Queries** using SQL (SQLite / MySQL)
4. **Interactive BI Dashboard Creation** using Tableau Desktop
5. **Business Insights & Management Report** synthesizing actionable findings

---

## 📁 Repository Structure

```plaintext
business_intership/
│
├── TASK 1/
│   ├── Business_Insights_Report.pdf    # Mandatory 2-page executive report (PDF)
│   ├── Business_Insights_Report.md     # Markdown version of business insights
│   ├── Book1.twb                       # Interactive Tableau Dashboard workbook
│   ├── dashboard_screenshot.png        # High-resolution screenshot of the dashboard
│   ├── queries.sql                     # SQL data extraction & aggregation queries
│   ├── cleaned_sales_data.xlsx         # Cleaned Excel dataset with standardized formats
│   ├── Sales.csv                       # Cleaned CSV used for database & BI import
│   ├── train.csv                       # Original raw dataset
│   └── Data Analytics & Business Intelligence- Task 1.pdf # Assignment specification
│
├── cleaned_sales_data.xlsx             # Cleaned Excel file linked to Tableau workbook
├── README.md                           # Comprehensive project documentation
└── .gitignore                          # Git ignore rules for system artifacts
```

---

## 📊 Dashboard Preview

![Tableau Sales Dashboard](TASK%201/dashboard_screenshot.png)

### Key Dashboard Components:
- **KPI Cards:**
  - **Total Sales Volume:** \$2,261,255
  - **Total Orders:** 4,922
- **Sales by Region:** Bar chart highlighting regional revenue distributions (West, East, Central, South).
- **Sales by Category:** Donut/Pie visual showing Technology ($827K), Furniture ($728K), and Office Supplies ($705K).
- **Monthly Sales Trend:** Longitudinal time-series tracking sales spikes across all 48 months.
- **Top Customers:** Table ranking top enterprise clients by lifetime transaction value.
- **Interactive Slicers / Filters:** Multi-select filtering across Region, Category, and Date sliders.

---

## 🛠️ Step-by-Step Implementation

### Part A: Data Cleaning (Microsoft Excel)
- **Duplicate Removal:** Inspected 9,800 records and removed redundant entries, yielding 9,799 clean transaction rows.
- **Date Standardization:** Transformed mixed-format dates (`DD/MM/YYYY`) into standard ISO format (`YYYY-MM-DD`).
- **Data Integrity:** Reconciled missing Postal Code records and validated numeric types for `Sales`, `Row ID`, and `Postal Code`.
- **Saved Output:** `cleaned_sales_data.xlsx` and exported `Sales.csv`.

### Part B: Exploratory Data Analysis (Excel)
- Calculated aggregate summary metrics:
  - **Total Sales:** \$2,261,255.41
  - **Total Orders:** 4,922
  - **Average Order Value (AOV):** \$459.42
- Pivot table multidimensional cuts by Region, Category, Sub-Category, and Year.

### Part C: SQL Data Extraction (`queries.sql`)
The dataset was imported into a relational schema:

```sql
CREATE TABLE sales (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2)
);
```

#### SQL Query Highlights:
1. **Total Sales by Region:**
   ```sql
   SELECT region, ROUND(SUM(sales), 2) AS total_sales
   FROM sales
   GROUP BY region
   ORDER BY total_sales DESC;
   ```
   *Output:* West (\$710,219.68), East (\$669,237.35), Central (\$492,646.91), South (\$389,151.46).

2. **Top 5 Products by Sales:**
   ```sql
   SELECT product_name, ROUND(SUM(sales), 2) AS total_sales
   FROM sales
   GROUP BY product_name
   ORDER BY total_sales DESC
   LIMIT 5;
   ```
   *Leader:* Canon imageCLASS 2200 Advanced Copier (\$61,599.82).

3. **Top 5 Customers by Sales:**
   ```sql
   SELECT customer_name, ROUND(SUM(sales), 2) AS total_sales
   FROM sales
   GROUP BY customer_name
   ORDER BY total_sales DESC
   LIMIT 5;
   ```
   *Leader:* Sean Miller (\$25,043.05).

---

## 📈 Key Business Insights & Recommendations

1. **Regional Strategy (West & East Dominate):**
   - The West (31.4%) and East (29.6%) represent **61.0%** of total business revenue.
   - *Recommendation:* Prioritize fulfillment center investments in Western and Eastern hubs, while initiating focused sales incentive programs in the South (17.2%) to capture untapped market potential.

2. **Category Strategy (Technology as Revenue Anchor):**
   - Technology leads total revenue at \$827,456 (36.6%), while Office Supplies leads transaction frequency.
   - *Recommendation:* Introduce bundled solution packages pairing high-ticket enterprise Technology items with recurring Office Supplies service contracts.

3. **Seasonality & Inventory Planning (Q4 Peak):**
   - Sales surge substantially in Q4, peaking in November (\$117.9K) and December due to corporate year-end budget clearance and holiday demand.
   - *Recommendation:* Ramp up procurement and inventory buffers by August/September to avoid stock-outs during peak seasonal demand.

4. **Key Account Management:**
   - The top 5 customers generate over \$90,000 in sales.
   - *Recommendation:* Establish a dedicated VIP Key Account Management (KAM) tier for top 20 accounts to secure multi-year contracts and improve customer retention.

---

## 📋 Deliverables Checklist

- [x] Cleaned Excel dataset (`cleaned_sales_data.xlsx`)
- [x] Structured SQL query script (`TASK 1/queries.sql`)
- [x] Interactive Tableau workbook (`TASK 1/Book1.twb`)
- [x] High-resolution Dashboard screenshot (`TASK 1/dashboard_screenshot.png`)
- [x] Executive Business Insights Report in PDF (`TASK 1/Business_Insights_Report.pdf`)
- [x] Business Insights Report in Markdown (`TASK 1/Business_Insights_Report.md`)
- [x] Comprehensive GitHub repository documentation (`README.md`)

---
*Submitted as part of the Maincrafts Technology Data Analytics & Business Intelligence Internship Program.*
