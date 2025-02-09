# Bank Customer & Product Analytics


## Overview
This Power BI project analyzes banking customers and their product applications. The dataset includes details such as customer demographics, income classification, application amounts, and loan statuses. The dashboard provides insights into customer segmentation, loan demand, and overall financial trends.


## Data Sources
- SQL Database: Extracts structured banking data using SQL queries.
- Power BI: The .pbix file visualizes key insights using interactive dashboards.


## Key Features
- Customer Analysis
  - Customer demographics (age, gender, nationality, city, address).
  - Income classification (Low, Medium, High).
  - User device and login type tracking.

- Application & Loan Analysis
  - Loan applications by amount, interest rate, and contract period.
  - Loan contract status (Active, Closed, Others).
  - Total demand per customer and product type.


## SQL Queries Used
The project uses two SQL scripts to extract relevant data:

- application_analysis.sql
  - Retrieves customer applications, loan amounts, interest rates, and contract details.
  - Categorizes loan status as Active, Closed, or Others.
  - Calculates total demand per customer and per product.

- customer_analysis.sql
  - Extracts customer details, including name, age, gender, income, and location.
  - Segments customers based on income classes.
  - Tracks device usage and login types for registered users.


## Visualisations
The Power BI report includes:
  - Customer Demographics & Income Segmentation
  - Total Loan Demand & Loan Status Breakdown
  - Application Trends Over Time
  - Top Products by Loan Demand
