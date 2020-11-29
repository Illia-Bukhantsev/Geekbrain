use snet0611;

-- 1) Task 1

ALTER TABLE snet0611.users ADD updated_at DATETIME default now();

select updated_at, created_at from users;

alter change 

select id,created_at from users where created_at < '29.11.2020';

update users 
	SET created_at='2020-11-29 12:26:08.000'
	WHERE created_at < '29.11.2020';

select * from users where created_at >= '2020-11-29' ;

-- 2) Task 2

ALTER TABLE users MODIFY COLUMN created_at DATETIME DEFAULT CURRENT_TIMESTAMP default now();
ALTER TABLE users MODIFY COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP default now();

-- 3) Task 3

select firstname, timestampdiff(year, birthday, now()) As age from users order by age is not null;

-- 5) Task 4

select firstname, monthname(birthday)as m from users where birthday LIKE '%-05-%' OR birthday LIKE '%-08-%';

-- 5) Task 5

select * from users where id In(5,1,2) order by id desc;