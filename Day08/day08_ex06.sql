--Сессия №1
--Начнем транзакцию 
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Сессия №2
--Начнем транзакцию 
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Сессия №1
--Проверим сумму рейтингов всех пиццерий
SELECT SUM(rating) FROM pizzeria;

--Сессия №2
--Зададим рейтинг Пицца Хат
UPDATE pizzeria SET rating = 5 WHERE id = 1;
--Опубликуем изменения
COMMIT;

--Сессия №1
--Проверим сумму рейтингов всех пиццерий
SELECT SUM(rating) FROM pizzeria;
--Опубликуем изменения
COMMIT;
--Проверим сумму рейтингов всех пиццерий
SELECT SUM(rating) FROM pizzeria;

--Сессия №2
--Проверим сумму рейтингов всех пиццерий
SELECT SUM(rating) FROM pizzeria;