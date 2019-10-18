drop database if exists vk;
create database vk;
use vk;

drop table if exists users;
create table users(
	id serial primary key,
	firstname varchar(100),
	lastname varchar(100),
	email varchar(120) unique,
	password_hash varchar(100),
	phone bigint,
	
	index(phone),
	index(firstname, lastname)
);

drop table if exists `profiles`;
create table `profiles`(
	user_id serial primary key,
	gender char(1),
	birthday date,
	photo_id bigint unsigned null,
	hometown varchar(100),
	
	created_at datetime default now()
);
alter table `profiles`
	add constraint fk_user_id
	foreign key(user_id) references users(id)
	on update cascade
	on delete restrict
;

drop table if exists messages;
create table messages(
	id serial primary key,
	from_user_id bigint unsigned not null,
	to_user_id bigint unsigned not null,
	body text,
	
	created_at datetime default now(),
	
	index(from_user_id),
	index(to_user_id),
	foreign key(from_user_id) references users(id),
	foreign key(to_user_id) references users(id)
);

drop table if exists friend_requests;
create table friend_requests(
	initiator_user_id bigint unsigned not null,
	target_user_id bigint unsigned not null,
	status enum('requested', 'approved', 'declined', 'unfriended'),
	
	requested_at datetime default now(),
	updated_at datetime,
	
	primary key(initiator_user_id, target_user_id),
	
	index(initiator_user_id),
	index(target_user_id),
	foreign key(initiator_user_id) references users(id),
	foreign key(target_user_id) references users(id)
);

drop table if exists user_community;
create table user_community(
	user_id bigint unsigned not null,
	community_id bigint unsigned not null,
		
	primary key(user_id, community_id),
	
	foreign key(user_id) references users(id),
	foreign key(community_id) references users(id)
);

drop table if exists media_types;
create table media_types(
	id serial primary key,
	name varchar(150),
			
	created_at datetime default now()
);

drop table if exists media;
create table media(
	id serial ,
	media_type_id bigint unsigned not null,
	user_id bigint unsigned not null,
	body text,
	filename varchar(150),
	`size` int,
	-- metadata JSON,
	created_at datetime default now(),
	updated_at datetime default current_timestamp on update current_timestamp,
	
	primary key(id),
	
	index(user_id),
	foreign key(user_id) references users(id),
	foreign key(media_type_id) references media_types(id)
);

drop table if exists likes;
create table likes(
	id serial primary key,
	user_id bigint unsigned not null,
	media_id bigint unsigned not null,
			
	created_at datetime default now()
);

drop table if exists photo_albums;
create table photo_albums(
	id serial primary key,
	name varchar(150),
	user_id bigint unsigned not null,
	
	foreign key(user_id) references users(id)
);

drop table if exists photos;
create table photos(
	id serial primary key,
	album_id bigint unsigned not null,
	media_id bigint unsigned not null,
	
	foreign key(album_id) references photo_albums(id),
	foreign key(media_id) references media(id)
);