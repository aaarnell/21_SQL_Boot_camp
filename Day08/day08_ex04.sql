--Сессия №1
--Начнем транзакцию 
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--Сессия №2
--Начнем транзакцию 
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--Сессия №1
--Проверим рейтинг пиццерии Пицца Хат
SELECT * FROM pizzeria WHERE id = 1;

--Сессия №2
--Зададим рейтинг Пицца Хат
UPDATE pizzeria SET rating = 3.0 WHERE id = 1;
--Опубликуем изменения
COMMIT;

--Сессия №1
--Проверим рейтинг пиццерии Пицца Хат
SELECT * FROM pizzeria WHERE id = 1;
--Опубликуем изменения
COMMIT;
--Проверим рейтинг пиццерии Пицца Хат
SELECT * FROM pizzeria WHERE id = 1;

--Сессия №2
--Проверим рейтинг пиццерии Пицца Хат
SELECT * FROM pizzeria WHERE id = 1;