CREATE VIEW v_generated_dates AS
SELECT DATE(generate_series('2022-01-01'::timestamp, '2022-01-31'::timestamp, '1 day'::interval))
AS generated_date
ORDER BY 1;