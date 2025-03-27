CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE(f_num bigint) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE rec(f_num, a, b) AS (
        SELECT 0::bigint, 0::bigint, 1::bigint
        UNION ALL
        SELECT a + b, b, a + b FROM rec WHERE a + b <= pstop
    )
    SELECT rec.f_num FROM rec;
END;
$$ LANGUAGE plpgsql;