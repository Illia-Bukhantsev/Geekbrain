create database snet0611 character set =utf8mb4;
-- Created database
use snet0611;
-- used db 
create table users(
	 -- `` - highlight the word inside and use name if , comment 'создает комментарий'
	`id` serial primary key , -- bigint(больщой размер числа) unsigned(только положительные числа) not null(не пустое) auto_increment (увеличивает +1 к дальшему дальшему созданому стобцу) 
	-- unique (значение не повторяються) primary key (индифицирует строку в таблице) SERIAL сокращает строку (bigint unsigned not null auto_increment unique primary key)
	`firstname` varchar(50), -- name of user
	`lastname` varchar(50), -- lastname of user
	`email` varchar(120) unique, -- unique обязательно использовать с имейлем
	`phone` varchar(20) unique, 
	`birthday` date, -- birthday date
	`hometown` varchar(100), -- native towm
	`genter` char(1), -- male or female, char - строковusersusersый тип данных, используеться для  економии ресурсов для вычисления длины(быстрее)
	`photo_id` bigint unsigned, -- инидификатор фото id, на практике всегда в отдельной таблице
	`create_at` datetime default now(), -- defauld столбец по умолчанию, now встроенная функция (создает текущее время)
	`password` char(40) -- всегда шифруеться
	-- delete_id bool,
	-- delete_at datetime
);

alter table users add index (phone); -- alter для команда поиска и редактирования 
alter table users add index users_firstname_lastname_idx (firstname, lastname); -- индекс ускоряет поиск по столбца (сложный индекс)
alter table users change column firstname firstname varchar(50) not null; -- запрет пустых значений

create table messages (
	`id` serial primary key , -- 
	`from_user_id` bigint unsigned not null, -- для чтобы не случилась колизия, нужно создать внешний ключ.
	`to_user_id` bigint unsigned not null, -- для чтобы не случилась колизия, нужно создать внешний ключ.
	`message_field` text,
	`is_read` bool default 0, -- highlight if message has read, bool (true '1', false '0')
	`create_at` datetime default now(), -- дата создания сообщение
	foreign key (from_user_id) references users(id), -- foreign key привязка таблиц друг к другу,references сcылание на столбец.
	foreign key (to_user_id) references users(id)
	);
use snet0611;
drop table friend_requestes;
create table if not exists friend_requestes(
	`initiator_user_id` bigint unsigned not null, -- запрос в друзья 
    `target_user_id` bigint unsigned not null, -- кому посылаеться запрос
    `status` enum('requested', 'approved', 'unfriended', 'declined'), -- enum список значений
    `requested_at` datetime default now(),
    `confirmed_at` datetime default current_timestamp on update current_timestamp,  -- current_timestamp метка времени количесво секунд
    primary key(initiator_user_id, target_user_id), -- композитный первичный ключ
    index(initiator_user_id),
    index(target_user_id),
    foreign key (initiator_user_id) references users(id),
    foreign key (target_user_id) references users(id)
);
	create table communities(
		`id` serial primary key,
        `group_name` varchar(150),
        index(group_name)
);
	create table users_communities(
		`user_id` bigint unsigned not null,
        `community_id` bigint unsigned not null,
        primary key(user_id, community_id),
		foreign key (user_id) references users(id),
		foreign key (community_id) references communities(id)
);
	create table posts(
		`id` serial primary key,
        `user_id` bigint unsigned not null,
        `post` text,
        `created_at` datetime default current_timestamp,
        `updated_at` datetime default current_timestamp on update current_timestamp, -- Время обновления публикации
        foreign key (user_id) references users(id)
    );
    
    create table comments(
    `id` serial primary key,
    `user_id` bigint unsigned not null,
    `post_id` bigint unsigned not null,
    `comment` text,
    `created_at` datetime default current_timestamp,
    `updated_at` datetime default current_timestamp on update current_timestamp,
    foreign key(user_id) references  users(id),
    foreign key(post_id) references posts(id)
    );
    
    create table photos(
    `id` serial primary key,
    `filename` varchar(200),
    `user_id` bigint unsigned not null,
    `description` text,
    `created_at` datetime default current_timestamp,
    foreign key(user_id) references users(id)
	);  