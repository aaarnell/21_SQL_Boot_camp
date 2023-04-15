SELECT person.id AS "person.id", 
	person.name AS "person.name", 
	person.age, 
    person.gender, 
	person.address, 
	pizzeria.id AS "pizzeria.id", 
	pizzeria.name AS "pizzeria.name", 
	pizzeria.rating 
FROm person
CROSS JOIN pizzeria
ORDER By person.id, pizzeria.id