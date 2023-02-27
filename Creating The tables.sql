/* Formatted on 03/01/2023 09:35:12 (QP5 v5.139.911.3011) */

-- Create a table named CONTRACTS
CREATE TABLE CONTRACTS
(
   Contract_ID             NUMBER (6) constraint CONTRACT_PK PRIMARY KEY ,
   Contract_STARTDATE      DATE,
   contract_ENDDATE        DATE,
   contract_total_fees     NUMBER (10),
   contract_deposit_fees   NUMBER (10),
   client_ID               NUMBER (6),
   contract_payment_type   VARCHAR2 (250),
   notes                   VARCHAR2 (250)
);

-- Create a table named CLIENTS
CREATE TABLE CLIENTS
(
   client_ID     NUMBER (6) constraint CLIENT_PK PRIMARY KEY,
   client_name   VARCHAR2 (250),
   mobile        NUMBER (20),
   address       VARCHAR2 (250),
   NID           NUMBER (20)
);
-- Create a table named INSTALLMENTS_PAID
CREATE TABLE INSTALLMENTS_PAID
(
   Installment_ID       NUMBER (6) constraint INSTALLMENT_PK PRIMARY KEY,
   contract_ID          NUMBER (6),
   installment_Date     DATE,
   installment_amount   NUMBER (8,2),
   paid                 NUMBER (6)
);

-- Create a foreign key constraint between the CONTRACTS and CLIENTS tables, where the client_ID column in the CONTRACTS table references the client_ID column in the CLIENTS table
ALTER TABLE CONTRACTS ADD CONSTRAINT FK_CLIENT FOREIGN KEY (client_id) REFERENCES CLIENTS (client_id);

-- Create a foreign key constraint between the INSTALLMENTS_PAID and CONTRACTS tables, where the contract_ID column in the INSTALLMENTS_PAID table references the contract_ID column in the CONTRACTS table
ALTER TABLE INSTALLMENTS_PAID ADD CONSTRAINT FK_CONTRACT FOREIGN KEY (CONTRACT_ID) REFERENCES CONTRACTS (CONTRACT_ID);
