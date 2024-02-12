COMMENT ON TABLE person_discounts IS 'A table contains all available discounts for visitors';
COMMENT ON COLUMN person_discounts.id IS 'Identifier for the discount';
COMMENT ON COLUMN person_discounts.person_id IS 'Identifier for the person who has a discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Identifier for the pizzeria where the person has a discount';
COMMENT ON COLUMN person_discounts.discount IS 'Percentage value of the discount';
