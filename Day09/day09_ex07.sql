CREATE OR REPLACE FUNCTION func_minimum(arr NUMERIC[]) 
RETURNS NUMERIC AS 
$$
DECLARE
  minimal NUMERIC := arr[1];
  number NUMERIC;
BEGIN
  FOREACH number IN ARRAY arr LOOP
    IF number < minimal THEN minimal := number;
    END IF;
  END LOOP;
  RETURN minimal;
END;
$$ LANGUAGE plpgsql;


