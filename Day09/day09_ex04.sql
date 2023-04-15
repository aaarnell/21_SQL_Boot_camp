CREATE OR REPLACE FUNCTION fnc_persons_female() 
	RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar)
	AS $$ SELECT * FROM person WHERE gender = 'female' $$ 
	LANGUAGE sql;
	
CREATE OR REPLACE FUNCTION fnc_persons_male()
	RETURNS TABLE (id bigint, name varchar, age integer, gender varchar, address varchar)
	AS $$ SELECT * FROM person WHERE gender = 'male' $$ 
	LANGUAGE sql;
