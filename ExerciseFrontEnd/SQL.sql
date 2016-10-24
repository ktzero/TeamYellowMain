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

create table userinfo 
(id int not null auto_increment, 
firstname varchar(30) not null, 
lastname varchar(30) not null, 
username varchar(15) not null,
password varchar(8) not null, 
PRIMARY KEY(id));

drop table exercise_tracking;

delete from exercise_tracking;

create table exercise_tracking (
	
	id int primary key auto_increment,	
	user_id varchar(30),
	dayNo varchar(25),
	exercise_id int,
	numberOfSets int not null,
	numberOfReps int,
	timeInMins int,
	todays_date date,
	complete boolean,
	foreign key (exercise_id)
	  references exercise(id)
		  
	);


insert tracking (user_id,dayNo, exerciseID, numberOfSets, numberOfReps, timeInMins, todays_date) values();



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
	intensity int,
	url varchar(500),
	foreign key (category_id)
	references exercise_category(id)

	);
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('BenchPress',"Works chest muscle",1,3,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('InclinePress',"Works chest muscle",1,3,"https://www.youtube.com/watch?v=DbFgADa2PL8");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('DeclinePress',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=LfyQBUKR8SE");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PushUps',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=Eh00_rniF8E");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Dips',"Works chest muscle",1,1,"https://www.youtube.com/watch?v=wjUmnZH528Y");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PullOver',"Works chest muscle",1,1,"https://www.youtube.com/watch?v=tpLnfSQJ0gg");

insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PullUps',"Works Back muscle",2,3,"https://www.youtube.com/watch?v=Ir8IrbYcM8w");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('WideGripPullDown',"Works Back muscle",2,3,"https://www.youtube.com/watch?v=Ad_WOMtfyc4");

insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Squats',"Works Back muscle",3,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Lunges',"Works Back muscle",3,3,"");

insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('BarbellCurl',"Works Back muscle",4,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PressDown',"Works Back muscle",4,3,"");

insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Planks',"Works Back muscle",5,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Crunches',"Works Back muscle",5,3,"");


