use snet0611;



select
	firstname ,
    lastname,
    hometown,
    'personal_photo',
	'friends',
	(select count(*) from friend_requestes where target_user_id = u.id and `status` = 'requested') as 'followers',
    'photos'
from users as u
where id = 61;

select count(*) from friend_requestes where target_user_id = 1 and `status` = 'requested';

select
	firstname ,
    lastname,
    birthday,
    gender,
from users as u
where id in ();
select * from (
select 
	case 
		when  target_user_id = 60 and `status` = 'approved' then initiator_user_id
		when  initiator_user_id = 60 and `status` = 'approved' then target_user_id
	end as friend_id
from friend_requestes) as fr_list where friend_id is not null;