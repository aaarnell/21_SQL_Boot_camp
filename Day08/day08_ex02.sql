--Сессия №1
--Начнем транзакцию
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Сессия №2
--Начнем транзакцию
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Сессия №1
--Проверим рейтинг пиццерии Пицца Хат
SELECT * FROM pizzeria WHERE id = 1;

--Сессия №2
--Проверим рейтинг пиццерии Пицца Хат
SELECT * FROM pizzeria WHERE id = 1;

--Сессия №1
--Зададим рейтинг Пицца Хат =4
UPDATE pizzeria SET rating = 4 WHERE id = 1;

--Сессия №2
--Зададим рейтинг Пицца Хат =3.6
UPDATE pizzeria SET rating = 3.6 WHERE id = 1;

--Сессия №1
--Опубликуем изменения
COMMIT;

--Сессия №2
--Опубликуем изменения
COMMIT;

--Сессия №1
--Проверим рейтинг пиццерии Пицца Хат
SELECT * FROM pizzeria WHERE id = 1;

--Сессия №2
--Проверим рейтинг пиццерии Пицца Хат
SELECT * FROM pizzeria WHERE id = 1;