CREATE VIEW v_generated_dates AS 
		SELECT gen_s::date AS generated_date 
		FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') AS gen_s
		ORDER BY generated_date;