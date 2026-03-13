## Simple Banking System (SQL Project)
# Overview
The Simple Banking System is a structured SQL project designed to simulate how a bank manages its customers, accounts, and financial transactions. The project focuses entirely on SQL and relational database concepts, which helps to understand how real-world banking systems store and process data.
This project demonstrates how databases can represent business entities such as customers, bank accounts, and transactions while enforcing relationships between them.

## Project Problem Statement
Modern banks manage large amounts of customer and financial data, including customer information, account details, and daily transactions. Without a well-structured database system, it becomes difficult to store, organize, and retrieve this information efficiently.
The problem this project addresses is how to design a relational database system that can efficiently manage banking operations, including tracking customers, managing multiple accounts per customer, and recording financial transactions.

# The system must allow users to:
•	Store and manage customer information
•	Maintain multiple bank accounts for each customer
•	Record and track deposits, withdrawals, and transfers
•	Retrieve and analyze financial data using SQL queries
•	Apply conditions to identify patterns such as high-value accounts, specific transaction ranges, and regional customer distributions
By designing and querying this database, the project demonstrates how SQL can be used to simulate real-world banking data management and support data-driven decision-making.

## Technologies Used
•	MySQL
•	MySQL Wotkbench
•	Google sheets (CSV)
Database schema & ER Diagram
The database design follows a normalized relational schema represented using an Entity–Relationship Diagram (ERD) with one-to-many relationships between Customers, Accounts, and Transactions.

## Key Queries Performed
The project includes several SQL queries used to retrieve, filter, and analyze banking data stored in the database. These queries demonstrate SQL skills used in managing financial data.

1. Retrieve Specific Customer Details
Fetches selected columns such as customer name and city.
SELECT first_name, last_name, city
FROM Customers;

2. Find Accounts with High Balances
Identifies accounts with balances greater than ₦100,000.
SELECT *
FROM Accounts
WHERE balance > 100000;

3. Filter Transactions by Type
Retrieves only deposit transactions.
SELECT *
FROM Transactions
WHERE transaction_type = 'Deposit';

4. Find Highest Account Balances
Displays accounts with the highest balances first.
SELECT *
FROM Accounts
ORDER BY balance DESC;

5. Retrieve Top 5 Largest Transactions
Displays the highest transaction amounts.
SELECT *
FROM Transactions
ORDER BY amount DESC
LIMIT 5;

## Technical Challenges & Solutions
Table design: The table design was a very challenging part, I had to go through so many youtube videos to understand some of it and implement.
Keys: I didn’t understand the primary and foreign keys and which is which. I had to also go through youtube videos for clarification.

