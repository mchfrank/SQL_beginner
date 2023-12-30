COMMENT ON TABLE person_discounts IS 'Records information on individual discounts based on the number of orders made.';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier for each entry.';
COMMENT ON COLUMN person_discounts.person_id IS 'Distinctive ID for an individual from the order list.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Distinctive ID for the pizzeria where the person placed an order.';
COMMENT ON COLUMN person_discounts.discount IS 'Discount value calculated in accordance with the number of orders.';