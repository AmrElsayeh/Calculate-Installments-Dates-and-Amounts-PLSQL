CREATE OR REPLACE FUNCTION number_of_months (payment_type VARCHAR2)
   RETURN NUMBER
IS
BEGIN
   CASE payment_type
      WHEN 'ANNUAL'
      THEN
         RETURN 12;
      WHEN 'HALF_ANNUAL'
      THEN
         RETURN 6;
      WHEN 'QUARTER'
      THEN
         RETURN 3;
      WHEN 'MONTHLY'
      THEN
         RETURN 1;
   END CASE;
END;