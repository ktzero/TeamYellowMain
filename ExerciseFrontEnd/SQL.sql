-- drop table if exists ;


create table client(
	id int primary key auto_increment,
	first_name varchar(50) not null, last_name varchar(50),
	last_name varchar(50) not null, last_name varchar(50),
	startDate date,
	userID varchar(10), 
	password varchar(10),
	);
	
insert into client(id, first_name, last_name,UserID, password) values('Karen','Reiter', karen123, yellow);


create table tracking (
	
	id int primary key auto_increment,	
	client_id int,
	exercise_id int,
	food_id int,
	numberOfSets int not null,
	numberOfReps int,
	amountOfTime int,
	todays_date date,
	
	foreign key (client_id)
	  references client(id)
	);


insert tracking (id, exerciseID, numberOfSets, numberOfReps, start, client_id) values();


create table food(
	id int primary key,
	description varchar(50) not null,
	calories int,
	protein int,
	carbs int,
	client_id int,
	foreign key (client_id)
	  references client(id)
);
insert into food(id,description,calories, protein, carbs, client_id) values(1,'food',100,100,1);


create table execrise_client_relationship(
	id int primary key auto_increment,
	exercise_id int not null,
	client_id int not null,
	foreign key (exercise_id)
	  references exercise(id),
	foreign key (client_id)
	  references client(id)
	);
INSERT exercise_client_relationship (exercise_id, client_id) VALUES(10,10); 
 

create table food_client_relationship(
	id int primary key auto_increment,
	food_id int not null,
	client_id int not null,
	foreign key (food_id)
	  references food(id),
	foreign key (client_id)
	  references client(id)
	);
INSERT food_client_relationship (food_id, client_id) VALUES(1,11);



drop table exercise_category;

create table exercise_category(
	id int primary key auto_increment,
	description varchar(30)
	);

INSERT exercise_category( description) VALUES('CHEST');
INSERT exercise_category( description) VALUES('BACK');
INSERT exercise_category( description) VALUES('LEGS');
INSERT exercise_category( description) VALUES('ARMS');
INSERT exercise_category( description) VALUES('CORE');




drop table exercise;

create table exercise (
	id int primary key auto_increment,
	exercise_name varchar(50) not null,
	exercise_desc varchar(200) not null,
	category_id int,
	url varchar(500),
	foreign key (category_id)
	references exercise_category(id)

	);
insert into exercise(exercise_name,exercise_desc,category_id,url) values('BenchPress',"Works chest muscle",1,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,url) values('InclinePress',"Works chest muscle",1,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,url) values('DeclinePress',"Works chest muscle",1,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,url) values('PushUps',"Works chest muscle",1,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,url) values('Dips',"Works chest muscle",1,"https://www.youtube.com/watch?v=rT7DgCr-3pg");

insert into exercise(exercise_name,exercise_desc,category_id,url) values('PullUps',"Works Back muscle",2,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,url) values('WideGripPullDown',"Works Back muscle",2,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
