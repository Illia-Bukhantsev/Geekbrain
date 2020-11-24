
-- CRUD
-- CREATE
-- READ
-- UPDATE
-- DELETE

-- INSERT По таблице user и community обновил с 0. То что накоримил с http://filldb.info/ было ужасно

select lastname,hometown from users where hometown = 'Москва'; -- город Москва
select count(distinct hometown) from users; -- подсчет городов (19)

select hometown, count(*) from users group by hometown; -- -- группировал по городу и считал, сколько пользователей в каждом городе
-- На основании статистики заменил Казань на Киев (15 случаев)
-- UPDATE 
update users 
set 
	hometown = 'Киев' where hometown = 'Казань' ; -- скрип не работал в Workbench но без проблем выполнился в DBeaver 

select * from users limit 10 offset 10;-- пропуситил первые 10 (offset), выбирал 10 

-- ДЗ п.1
-- 
-- 1) с помощью alter поставить в табл. friends_reqiests default status requested

alter table friend_requestes change column status status enum('requested', 'approved', 'unfriended', 'declined') default 'requested'; -- поставил по умолчанию

INSERT INTO users 
(firstname,lastname,email,phone,gender,birthday,hometown,photo_id,password,create_at) 
VALUES 
('Сергей','Сергеев','qwe@asdf.qw',123123123,'m','1983-03-21','Саратов',NULL,
'fdkjgsdflskdjfgsdfg142356214','2020-09-25 22:09:27.0'); -- Добавил Серегу

INSERT INTO snet0611.friend_requestes (initiator_user_id,target_user_id,requested_at,confirmed_at)
	VALUES (101,144,'2003-03-04 02:32:06','2000-12-28 12:23:17'); -- Конторль выполнения  friends_reqiests default status requested

-- 2) с помощью alter поставить в табл. переименова create_at в created_at

alter table users rename column create_at to created_at; -- выполнено дз 2
    
