CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $$
DECLARE min_val numeric;
BEGIN 
    SELECT MIN(val) INTO min_val FROM unnest(arr) AS val;
RETURN min_val;
END;
$$
LANGUAGE plpgsql;