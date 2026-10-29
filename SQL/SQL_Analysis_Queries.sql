-- DATA BASE CREATION

create database project_wallmart;
use project_wallmart;



-- DATA EXPLORATION 

select count(*) as total_rows ,
 count(distinct customer_ID) as uniques_cutomers
	from customer_demographics;


select count(*) as total_rows ,
 count(distinct TRANSACTION_ID) as uniques_transactions
	from customer_transactions;




-- REVENUE ANALYSIS 

select count(*) as total_transactions ,
 sum(amount) as total_revenue,avg(amount) as Average_revenue
	from customer_transactions;


select d.preferred_channel ,sum(t.amount) as total_amount from customer_demographics
	d join customer_transactions t on d.customer_id=t.customer_id group by d.preferred_channel
		order by sum(t.amount);




-- CHURN ANALYSIS 

select count(*) as total_records ,
	count( distinct customer_id) as unique_customers, 
		churn_flag from churn_labelled_customers
			group by churn_flag order by churn_flag;
    



select count(distinct customer_id) as total_customers,
	count(distinct case when churn_flag=1 then customer_id end ) as
		churned_customer,100.0* (count(distinct case when churn_flag=1 then
			customer_id end )/count(distinct customer_id)) as churn_rate from
            churn_labelled_customers; 



select churn_reason , count(distinct case when churn_flag = 1 then customer_id end )
	as churned_customers from churn_labelled_customers group by churn_reason order by
		churned_customers DESC ; 

select d.region ,count(distinct c.customer_id) as total_customers,
	count(distinct case when c.churn_flag = 1 then c.customer_id end ) as churned_customers
		,100.0 * (count(distinct case when c.churn_flag=1 then c.customer_id end )/count(distinct c.customer_id)) 
			as churn_rate from churn_labelled_customers c join customer_demographics d  on c.customer_id=d.customer_id 
				group by d.region order by churn_rate desc ; 
 
 
 
 
-- Churn rate across age group  
 
SELECT
    CASE
        WHEN d.Age <= 20 THEN '0-20'
        WHEN d.Age BETWEEN 21 AND 40 THEN '21-40'
        WHEN d.Age BETWEEN 41 AND 60 THEN '40-60'
        WHEN d.Age >=61 THEN '61+'
    END AS Age_Group,
    COUNT(DISTINCT CASE
        WHEN c.Churn_Flag = 1 THEN c.Customer_ID
    END) AS Churned_Customers,
    COUNT(DISTINCT c.Customer_ID) AS Total_Customers,
    COUNT(DISTINCT CASE
        WHEN c.Churn_Flag = 1 THEN c.Customer_ID
    END) * 100.0
    / NULLIF(COUNT(DISTINCT c.Customer_ID), 0) AS Churn_Rate_Percentage
FROM Customer_Demographics d
JOIN Churn_Labelled_Customers c
    ON d.Customer_ID = c.Customer_ID
GROUP BY
    CASE
        WHEN d.Age <= 20 THEN '0-20'
        WHEN d.Age BETWEEN 21 AND 40 THEN '21-40'
        WHEN d.Age BETWEEN 41 AND 60 THEN '40-60'
        WHEN d.Age >=61 THEN '61+'
    END
ORDER BY Churn_Rate_Percentage DESC;




-- LOYALTY ANALYSIS 


SELECT  l.loyalty_tier ,sum(t.amount) as total_amount from
	customer_transactions t join loyalty_program l on t.customer_id=l.customer_id
		group by l.loyalty_tier order by sum(t.amount);
        
        
        
        
-- PRODUCT ANALYSIS 
      
SELECT
    Product_Category,
    SUM(Amount) AS Total_Revenue,
    SUM(Amount) * 100.0
        / NULLIF(
            (SELECT SUM(Amount)
             FROM Customer_Transactions), 0
        ) AS Revenue_Contribution_Percentage
FROM Customer_Transactions
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;





-- PROMOTION ANALYSIS

SELECT promotion_applied ,sum(amount) as total_amount,count(*) as promotion
	from customer_transactions group by promotion_applied;





-- POINT EARNED VS POINT REDEEMED


SELECT
    SUM(Points_Earned) AS Total_Points_Earned,
		SUM(Points_Redeemed) AS Total_Points_Redeemed,
			SUM(Points_Redeemed) * 100.0
				/ NULLIF(SUM(Points_Earned), 0) AS Redemption_Percentage
						FROM Loyalty_Program;