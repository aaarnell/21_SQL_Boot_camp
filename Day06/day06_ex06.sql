-- Создание последовательности, если она не существует
CREATE SEQUENCE IF NOT EXISTS seq_person_discounts
    START WITH 1;

-- Установка значения по умолчанию для столбца id таблицы person_discounts
ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');

-- Установка текущего значения последовательности
SELECT SETVAL('seq_person_discounts', (SELECT COUNT(id)+1 FROM person_discounts), FALSE);
