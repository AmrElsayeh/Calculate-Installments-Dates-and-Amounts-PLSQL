CREATE OR REPLACE FUNCTION Installments (start_date      DATE,
                                         end_date        DATE,
                                         payment_type    VARCHAR2)
   RETURN NUMBER
IS
   no_of_installments   NUMBER (2);
BEGIN
   CASE payment_type
      WHEN 'ANNUAL'
      THEN
      no_of_installments := months_between(end_date,start_date)/12;
      WHEN 'HALF_ANNUAL'
      THEN
         no_of_installments := MONTHS_BETWEEN (end_date, start_date) / 6;
      WHEN 'QUARTER'
      THEN
         no_of_installments := MONTHS_BETWEEN (end_date, start_date) / 3;
      WHEN 'MONTHLY'
      THEN
         no_of_installments := MONTHS_BETWEEN (end_date, start_date);
   END CASE;

   RETURN no_of_installments;
END;