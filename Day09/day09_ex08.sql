CREATE OR REPLACE FUNCTION fnc_fibonacci (IN pstop INTEGER DEFAULT 10)
RETURNS TABLE (number INTEGER) AS 
$$ 
DECLARE
	prev_num INTEGER := 1;
	cur_num INTEGER := 0;
	next_num INTEGER := 0;
BEGIN
	DROP TABLE IF EXISTS temp_table;
	CREATE TEMPORARY TABLE IF NOT EXISTS temp_table (
	  nums INTEGER
	);
	
	LOOP
    	INSERT INTO temp_table
		VALUES(cur_num);
		
		next_num := cur_num + prev_num;
		prev_num := cur_num;
		cur_num := next_num;
    	EXIT WHEN cur_num > pstop;
	END LOOP;

	RETURN QUERY
	SELECT nums FROM temp_table;
END;
$$ LANGUAGE plpgsql;

