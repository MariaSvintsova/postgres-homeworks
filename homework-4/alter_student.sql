-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar,
-- birthday date, phone varchar
CREATE TABLE student (
            student_id serial,
            last_name varchar,
            birthday date,
            phone varchar
);


-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student ADD COLUMN middle_name varchar;

-- 3. Удалить колонку middle_name
ALTER TABLE student DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student RENAME COLUMN birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (last_name, birth_date, phone) VALUES ('Green', '1990-01-01', 898789877678);
INSERT INTO student (last_name, birth_date, phone) VALUES ('Yelloy', '3040-02-02', 8986789877678);
INSERT INTO student (last_name, birth_date, phone) VALUES ('Prupupu', '2060-03-03', 098765434567);

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student RESTART IDENTITY;