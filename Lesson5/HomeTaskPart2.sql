use snet0611;

-- 1) Task 1

select avg(timestampdiff(year, birthday, now())) as Average_Age from users; 

-- 2) Task 2

select distinct dayname(birthday), count(*) from users group by dayname(birthday);

select distinct dayname(birthday), count(utc_date()) as Counted_causes from users group by dayname(birthday);-- ???? ?????? ?? ?? ???? ??? ??? ?????????

-- 2) Task 3

declare @X INT
set @X = 1

while @X <= 5
begin 
	print @X
	set @X = (@X + 1)*X 
end;

