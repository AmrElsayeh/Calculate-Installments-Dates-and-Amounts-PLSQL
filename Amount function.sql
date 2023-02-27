/* Formatted on 03/01/2023 11:44:18 (QP5 v5.139.911.3011) */
-- Define a function named amount that takes three input parameters

CREATE OR REPLACE FUNCTION amount (no_of_installments    NUMBER,
                                   fees                  NUMBER,
                                   deposit               NUMBER)
-- Specify the return type of the function

   RETURN NUMBER
IS
   -- Declare a local variable to store the calculated amount
    amount number(8,2);
BEGIN
   -- Calculate the amount per installment by subtracting the deposit from the total fees and dividing the result by the number of installments
   amount := (fees - deposit) / no_of_installments;
      -- Return the calculated amount
   RETURN amount;
END;