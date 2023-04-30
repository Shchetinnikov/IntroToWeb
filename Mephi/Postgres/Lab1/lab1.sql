drop table if exists countries;
drop table if exists books;

----------------------------------------------------------

create table countries(
	country_id 	 SERIAL,
	country_name varchar(64) not null,
	primary key (country_id)
);

create table books(
	ISBN 	   varchar(32), 
	book_name  varchar(2000) not null unique,
	authors    varchar(2000) not null,
	publishing varchar(2000) not null,
	publication_date numeric(4) default 2016,
	pages_count numeric(4),
	price 		numeric(6) not null,
	country_id  int not null,
	primary key (ISBN),
	foreign key (country_id) references countries (country_id)
);