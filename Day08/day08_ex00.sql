--Сессия №1
--Обновить рейтинг "Pizza Hut".
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE id = 1;
--Проверить наличие изменений в сессии №1
SELECT * FROM pizzeria WHERE id = 1;

--Сессия №2
--Проверить отсутствие изменений в сессии №2
SELECT * FROM pizzeria WHERE id = 1;

--Сессия №1
--Опубликовать изменения в сессии №1
COMMIT;

--Сессия №2
--Проверить наличие изменений в сессии №2
SELECT * FROM pizzeria WHERE id = 1;