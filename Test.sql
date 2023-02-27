DECLARE
BEGIN
   DELETE FROM installments_paid;

   update_installments;
END;