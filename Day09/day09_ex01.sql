CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS 
$$
	BEGIN
		INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
		VALUES('U', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
		RETURN NEW;
	END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_update_audit();