
# SQL-Air-Cargo-Analysis

DESCRIPTION

Air Cargo is an aviation company that provides air transportation services for passengers and flight. Air Cargo uses its aircraft to provide different services with the help of partnerships or alliances with other airlines. The company wants to prepare reports on regular passengers, busiest routes, ticket sales details, and other scenarios to Improve the ease of travel and booking for customers.

Project_Objective

As a DBA expert,we need to focus on identifying the regular customers to provide offers, analyze the busiest route which helps to increase the number of aircraft required and prepare an analysis to determine the ticket sales details. This will ensure that the company improves its operability and becomes more customer-centric and a favorable choice for air travel.

Data Description:

Customer: Contains the information of customers
• customer id - ID of the customer

• first name - First name of the customer

• last name - Last name of the customer

• date of birth - Date of birth of the customer

• gender - Gender of the customer

passengers_on_flights: Contains information about the travel details
• aircraft id - ID of each aircraft in a brand

• route id - Route ID of from and to location

• customer id - ID of the customer

• depart - Departure place from the airport

• arrival - Arrival place in the airport

• seat num - Unique seat number for each passenger

• class id - ID of travel class

• travel date - Travel date of each passenger

• flight num - Specific flight number for each route

ticket_details: Contains information about the ticket details
• p date - Ticket purchase date

• customer id - ID of the customer

• aircraft id - ID of each aircraft in a brand

• class id - ID of travel class

• no of tickets - Number of tickets purchased

• a code - Code of each airport

• price_per ticket - Price of a ticket

• brand - Aviation service provider for each aircraft

routes: Contains information about the route details
• Route id - Route ID of from and to location

• Flight num - Specific fight number for each route

• Origin airport - Departure location

• Destination airport - Arrival location

• Aircraft id - ID of each aircraft in a brand

• Distance miles - Distance between departure and arrival location

Here, the given data was in Excel, so we imported that to SQL and created a database and analyzed and wrote queries for some of the various specific information where Air Cargo can get clear insights of their company.