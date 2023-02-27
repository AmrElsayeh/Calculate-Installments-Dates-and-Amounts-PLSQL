# Calculate Installments' Dates and Amounts PLSQL
PLSQL project to Calculate the installments dates and amounts for contracts

## Project's Description:
PLSQL script that calculates the installments' dates and the amount of each date of a contract. It also handles the first installment. Then, adds all new data to a new table in the database schema.

- This PL/SQL code creates three tables named CONTRACTS, CLIENTS, and INSTALLMENTS_PAID. The CONTRACTS table has several columns including Contract_ID, Contract_STARTDATE, contract_ENDDATE, contract_total_fees, contract_deposit_fees, client_ID, contract_payment_type, and notes. The CLIENTS table has columns named client_ID, client_name, mobile, address, and NID. The INSTALLMENTS_PAID table has columns named Installment_ID, contract_ID, installment_Date, installment_amount, and paid.

- Additionally, the code defines two primary keys using PRIMARY KEY constraint on the Contract_ID column of the CONTRACTS table and the client_ID column of the CLIENTS table. Moreover, it establishes a foreign key constraint between the CONTRACTS and CLIENTS tables, where the client_ID column in the CONTRACTS table references the client_ID column in the CLIENTS table. Similarly, the INSTALLMENTS_PAID table has a foreign key constraint with the CONTRACTS table on the contract_ID column.

## Tools and Technologies:
- SQL and PLSQL.
- Triggers
- TOAD.
