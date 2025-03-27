COMMENT ON TABLE person_discounts IS 'Таблица содержит информацию о скидках';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ таблицы';
COMMENT ON COLUMN person_discounts.person_id IS 'id клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Скидки, предоставляемые клиентам';