# Business Insights

The results below are based on the SQL result screenshots and Power BI chart values provided for this project. Validate the numbers against the final database and report before submission.

## 1. Executive Summary
This project investigates customer churn, customer lifetime value (CLV), loyalty engagement, and revenue patterns using SQL Server and Power BI.

## 2. Overall Customer Churn Rate
- **Question:** What proportion of customers are classified as churned?
- **Result:** Approximately **49.67%** (149 of 300 customers, based on the recorded result).
- **Interpretation:** About half of the customers in the analyzed population are labelled as churned.
- **Business implication:** Investigate purchasing patterns and engagement to identify potential opportunities to improve retention.

## 3. Churn by Region
- **Question:** Which region has the highest churn rate?
- **Result:** **West: 60.00%** (30 churned of 50 customers). Central: 58.33%; North: 49.18%; East: 43.10%; South: 40.85%.
- **Interpretation:** West has the highest churn rate among the regions shown, while South has the lowest.
- **Business implication:** Investigate customer experience, engagement, and purchasing patterns in the West region.

## 4. Churn by Age Group
- **Question:** Which age group has the highest churn rate?
- **Result:** **21–40: 59.48%** (69 churned of 116 customers). Ages 0–20: 46.67%; 40–60: 43.55%; 61+: 42.22%.
- **Interpretation:** The 21–40 group has the highest churn rate in the displayed results; the 61+ group has the lowest.
- **Business implication:** Consider testing engagement strategies tailored to customer purchasing patterns in the 21–40 group.

## 5. Revenue by Product Category
- **Question:** Which product category contributes the most revenue?
- **Result:** **Groceries: $134,282.18**, approximately **26.01%** of total revenue. Electronics: $130,494.64 (25.28%); Home & Living: $128,621.76 (24.91%); Apparel: $122,861.94 (23.80%).
- **Interpretation:** Groceries is the highest-revenue category among the four shown. The contributions are relatively close.
- **Business implication:** Investigate opportunities for repeat purchases in Groceries and possible cross-selling with other categories.
- **Currency note:** The dollar symbol is used as requested. Confirm that USD matches the source data currency before final submission.

## 6. Customer Lifetime Value (CLV)
- **Question:** How are customers distributed across CLV segments?
- **Result:** **208 Low-CLV customers** (69.33%) and **92 High-CLV customers** (30.67%), for 300 customers total.
- **Interpretation:** Most customers fall into the Low-CLV segment according to the segmentation used in the Power BI dashboard. The supplied chart shows counts, not average CLV values.
- **Business implication:** Consider retention efforts for valuable customers who show signs of inactivity and investigate ways to encourage repeat purchases among Low-CLV customers.

## 7. Loyalty Program
- **Question:** How do earned and redeemed loyalty points compare?
- **Displayed chart values:** Premium: 0.20M earned, 0.17M redeemed; Plus: 0.20M earned, 0.18M redeemed; Basic: 0.18M earned, 0.12M redeemed; Elite: 0.18M earned, 0.15M redeemed.
- **Interpretation:** Earned points exceed redeemed points in all four tiers in the chart. Plus has the highest displayed redeemed points, while Basic has the lowest.
- **Business implication:** Investigate whether clearer communication or easier redemption options could improve loyalty-program engagement.
- **Limitation:** Values are rounded as displayed in Power BI. Calculate exact totals and redemption percentages from the underlying data before making precise claims.

## 8. Limitations
The analysis depends on the quality and completeness of the supplied dataset. Observed relationships do not establish causation. Some loyalty values are rounded in the dashboard. Confirm the dataset source, currency, calculations, and results before public release or formal submission. Business recommendations should be validated through further analysis or testing.
