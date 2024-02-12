CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $trg_person_update_audit$
    BEGIN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (CURRENT_TIMESTAMP, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
        RETURN NULL;
    END;
$trg_person_update_audit$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
