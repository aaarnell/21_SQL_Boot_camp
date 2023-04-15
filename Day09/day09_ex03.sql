CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
RETURNS TRIGGER AS 
$$
	BEGIN
		IF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
			VALUES('D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
			RETURN OLD;
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
			VALUES('U', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
			RETURN NEW;
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit(row_id, name, age, gender, address)
			VALUES(NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
			RETURN NEW;
        END IF;
		RETURN NULL;
	END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();