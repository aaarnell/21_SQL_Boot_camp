CREATE VIEW v_price_with_discount AS
SELECT pe.name, me.pizza_name, me.price, (me.price - me.price*0.1)::INT AS discount_price
FROM person_order po
JOIN person pe ON pe.id = po.person_id
JOIN menu me ON me.id = po.menu_id
ORDER BY pe.name, me.pizza_name