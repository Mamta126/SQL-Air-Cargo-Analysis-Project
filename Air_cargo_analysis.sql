-- Air Cargo Analysis Project

-- DESCRIPTION:
/* Air Cargo is an aviation company that provides air transportation services for passengers and freight. Air Cargo uses its aircraft to provide 
different services with the help of partnerships or alliances with other airlines. The company wants to prepare reports on regular passengers, busiest routes,
 ticket sales details, and other scenarios to improve the ease of travel and booking for customers.*/

-- Project Objective:
/* You, as a DBA expert, need to focus on identifying the regular customers to provide offers, analyze the busiest route which helps to increase the number of
 aircraft required and prepare an analysis to determine the ticket sales details. This will ensure that the company improves its operability and becomes more 
 customer-centric and a favorable choice for air travel. */
 -- Following operations should be performed:

use air_cargo_analysis
--Import datasets into table from wizard 
SELECT * FROM customer
SELECT * FROM passengers_on_flights
SELECT * FROM routes
SELECT * FROM ticket_details

/* 1. Write a query to display all the passengers_on_flights (customers)
who have travelled in routes 01 to 25. Take data from the passengers table.*/
SELECT C.first_name
FROM passengers_on_flights P LEFT JOIN customer C ON(C.customer_id=P.customer_id)
WHERE route_id BETWEEN 1 AND 25

/* 2. Write a query to identify the number of passengers and total revenue in business class from the ticket_details table.*/
SELECT  COUNT(customer_id) AS No_of_customers, SUM(Price_per_ticket) AS Total_price
FROM ticket_details  where class_id='Bussiness' 

/* 3. Write a query to display the full name of the customer by extracting the first name and last name from the customer table.*/
SELECT CONCAT(first_name,' ', last_name) AS Full_Name FROM customer 

/* 4. Write a query to extract the customers who have registered and booked a ticket.
Use data from the customer and ticket_details tables */
SELECT DISTINCT(C.customer_id) 
FROM ticket_details T LEFT JOIN customer C
ON C.customer_id = T.customer_id 
WHERE T.customer_id IS NOT NULL;

/* 5. Write a query to identify the customer’s first name and last name based on their customer ID and brand (Emirates) from the ticket_details table */
SELECT CONCAT(c.first_name,c.last_name) AS full_name 
FROM customer c LEFT JOIN ticket_details t
ON c.customer_id=t.customer_id
WHERE brand='Emirates'

/* 6. Write a query to identify the customers who have travelled by Economy Plus class using Group By and Having clause on the passengers_on_flights table */
SELECT count(customer_id) as total_customers FROM passengers_on_flights
GROUP BY class_id
HAVING class_id='economy'

/* 7. Write a query to identify whether the revenue has crossed 10000 using the CASE WHEN clause on the ticket_details table */
DECLARE @Price_per_ticket int = 10000
SELECT 
    (CASE 
        WHEN @Price_per_ticket <= (SELECT SUM(Price_per_ticket) FROM ticket_details) THEN 'crossed' 
        ELSE 'not crossed' 
    END) as Result

/* 8.  Write a query to find the maximum ticket price for each class using window functions on the ticket_details table*/

SELECT * FROM(
SELECT class_id,[Price_per_ticket], Row_number() OVER(PARTITION BY class_id order by price_per_ticket desc) as max_price
FROM ticket_details) temp_table WHERE max_price=1;
--OR
SELECT class_id, max(Price_per_ticket) OVER (PARTITION BY class_id) as max_ticket_price
FROM ticket_details

/* 9. Write a query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table */
select c.customer_id, c.first_name, c.last_name, p.aircraft_id, p.route_id from customer c inner join passengers_on_flights p 
on c. customer_id = p.customer_id
where route_id  = 4;

/*.10 For the route ID 4, write a query to view the execution plan of the passengers_on_flights table.*/
SELECT * FROM passengers_on_flights WHERE route_id=4;

/* 11. Write a query to calculate the total price of all tickets booked by a customer across different aircraft IDs using rollup function.*/
SELECT customer_id, aircraft_id, SUM(Price_per_ticket) AS total_price_of_all_tickets 
FROM ticket_details 
GROUP BY customer_id,aircraft_id with rollup;