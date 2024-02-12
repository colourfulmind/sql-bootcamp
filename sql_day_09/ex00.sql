CREATE TABLE IF NOT EXISTS person_audit (
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    CONSTRAINT ch_type_event CHECK (type_event = 'I' OR type_event = 'D' OR type_event = 'U'),
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
    BEGIN
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        RETURN NULL;
    END;
$trg_person_insert_audit$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');
