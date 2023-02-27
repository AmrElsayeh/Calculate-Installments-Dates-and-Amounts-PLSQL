--Here is a procedure for updating the installments from the contracts

CREATE OR REPLACE PROCEDURE update_installments
AS
   --defining the cursor which is holding the contract data
   CURSOR contract_cursor
   IS
      SELECT * FROM contracts;

   --initializing the parameter
   p_amount               NUMBER (8, 2);
   p_no_of_installments   NUMBER (3);
   p_months               NUMBER (2);
BEGIN
   --for loop of the cursor that hold the contract data
   FOR contract IN contract_cursor
   LOOP
      --after creating the function that's return the number of installments for each contract
      p_no_of_installments :=
         installments (contract.contract_startdate,
                       contract.contract_enddate,
                       contract.contract_payment_type);
      --after creating the function that's return the amount of fees for each installment in the contract
      p_amount :=
         amount (p_no_of_installments,
                 contract.contract_total_fees,
                 contract.contract_deposit_fees);
      --after creating the function that's return the number of  accumlative months for each installment in the contract
      p_months := number_of_months (contract.contract_payment_type);

      --another for loop to insert the values in the installment_paid table to update it
      FOR a IN 0 .. (p_no_of_installments - 1)
      LOOP
         INSERT INTO installments_paid (
                                        CONTRACT_ID,
                                        INSTALLMENT_DATE,
                                        INSTALLMENT_AMOUNT)
              VALUES (
                 contract.CONTRACT_ID,
                 ADD_MONTHS (contract.contract_startdate, p_months * a),
                 p_amount);
      END LOOP;
   END LOOP;
END;

show errors