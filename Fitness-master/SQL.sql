-- drop table if exists ;

drop table userinfo;

create table userinfo 
(id int not null auto_increment, 
firstname varchar(30) not null, 
lastname varchar(30) not null, 
username varchar(15) not null,
password varchar(8) not null, 
start_date date,
routine_created boolean,
caloriesPerDay int,
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


drop table exercise_category;

create table exercise_category(
	id int primary key auto_increment,
	description varchar(30),
	url varchar(500),
	explanation varchar(1000)
	);

INSERT exercise_category( description, url, explanation) VALUES('CHEST',"/images/Chest.jpg",
"The chest is such a noticeable muscle group. it is always first to walk into a room and therefore it is very important in a balanced physique to have an impressive big chest. The chest is used in pushing and wrapping your arms round something. The chest is made up of two main muscles.The Pectoralis major is that big muscle that covers each half of the front of your chest. One of its jobs is to turn your arm inward. Its other job is to help pull your arm forward and down. Pectoralis minor is directly under pectoralis major. It's attached to your third, fourth and fifth ribs at the bottom, and at the top it's attached to the front of your shoulder blade. It helps pull your shoulder blade down, and it helps hold your shoulder down when you have to push down with your hands.");

INSERT exercise_category( description,url, explanation) VALUES('BACK',"/images/Back.jpg",,
"The back isn't only one of the body's biggest and strongest bodyparts, it's also the most complicated in terms of being a series of interconnected muscle groups. For the purposes of this feature we're dividing the back into its four main regions: 1) the upper and outer lats, 2) the lower lats, 3) the middle back and 4) the lower back. Each area requires specific stimulation via the exercises and angles of attack used, and we'll show you the two best exercises for each.");

INSERT exercise_category( description,url, explanation) VALUES('LEGS',"/images/Legs.jpg",
"Supporting, balancing, and propelling the body is the work of the muscular system of the legs and feet. From the large, strong muscles of the buttocks and legs to the tiny, fine muscles of the feet and toes, these muscles can exert tremendous power while constantly making small adjustments for balance – whether the body is at rest or in motion.");

INSERT exercise_category( description,url, explanation) VALUES('ARMS',"/images/Arms.jpg",
"Everyone loves to flex their biceps, but Arms means more than biceps. The anterior component of the upper arm contains the biceps, coracobrachialis and brachialis muscles. Together, these flex the arm at the shoulder and elbow. The posterior component holds the triceps, which are antagonistic to the anterior muscles. The lower arm holds muscles that flex, abduct and supinate the hand, as well as many of the relatively small muscles and tendons that control individual fingers.");
INSERT exercise_category( description,url, explanation) VALUES('CORE',"/images/Core.jpg",
"The major muscles involved include the pelvic floor muscles, multifidus, transverse abdominis, rectus abdominis, internal and external obliques, erector spinae - particularly the longissimus thoracis, as well as the diaphragm. The minor core muscles involved include the glueteus maximus, latissimus dorsi, and trapezius. The function of the core is to stabilize the person's thorax and pelvis during dynamic movement, as well as to provide internal pressure in order to expel substances.");




drop table exercise;
delete from exercise;
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
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('DeclinePress',"Works chest muscle",1,3,"https://www.youtube.com/watch?v=LfyQBUKR8SE");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PushUps',"Works chest muscle",1,3,"https://www.youtube.com/watch?v=Eh00_rniF8E");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Dips',"Works chest muscle",1,3,"https://www.youtube.com/watch?v=wjUmnZH528Y");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PullOver',"Works chest muscle",1,3,"https://www.youtube.com/watch?v=tpLnfSQJ0gg");

insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('FlatMachinePress',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('MachineInclinePress',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=DbFgADa2PL8");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('MachineDeclinePress',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=LfyQBUKR8SE");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('KneelDownPushUps',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=Eh00_rniF8E");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('AssistedDips',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=wjUmnZH528Y");


insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PullUps',"Works Back muscle",2,3,"https://www.youtube.com/watch?v=Ir8IrbYcM8w");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('WideGripPullDown',"Works Back muscle",2,3,"https://www.youtube.com/watch?v=Ad_WOMtfyc4");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('SeatedRows',"Works Back muscle",2,3,"https://www.youtube.com/watch?v=Ir8IrbYcM8w");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('T-BarRow',"Works Back muscle",2,2,"https://www.youtube.com/watch?v=Ad_WOMtfyc4");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Deadlift',"Works Back muscle",2,2,"https://www.youtube.com/watch?v=Ir8IrbYcM8w");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('DumbbellRow',"Works Back muscle",2,2,"https://www.youtube.com/watch?v=Ad_WOMtfyc4");


insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Squats',"Works Legs muscle",3,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Lunges',"Works Legs muscle",3,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('StiffLegDeadlifts',"Works Legs muscle",3,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('LegPress',"Works Legs muscle",3,2,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('StandingCalfRaises',"Works Legs muscle",3,2,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Leg Curls',"Works Legs muscle",3,2,"");

insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('BarbellCurl',"Works Arms muscle",4,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PressDown',"Works Arms muscle",4,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('DumbbellCurl',"Works Arms muscle",4,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('21 curls',"Works Arms muscle",4,2,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PreacherCurls',"Works Arms muscle",4,2,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('TricepExtension',"Works Arms muscle",4,2,"");

insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Planks',"Works Core muscle",5,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Crunches',"Works Core muscle",5,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Situps',"Works Core muscle",5,3,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('WeightedCrunches',"Works Core muscle",5,2,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('LegRaises',"Works Core muscle",5,2,"");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('HangingKneeRaises',"Works Core muscle",5,2,"");


drop table if exists food_category;

	create table food_category(
		id int primary key auto_increment,
		description varchar(40)
		);
drop table if exists food;

create table food(
	id int primary key auto_increment,
	description varchar(50) not null,
	calories int,
	protein int,
	fat int,
	carbs int,
	category_id int,
		foreign key (category_id)
		references food_category(id)
);

drop table food_tracking; 

create table food_tracking (
	
	id int primary key auto_increment,	
	user_id varchar(30),
	dayNo varchar(25),	
	food_desc varchar(50),
	food_cat_id int,
	protein int,
	fat int,
	carbs int,
	calories int
			  
	);
	
create table date_map (
	id int primary key auto_increment,
	user_id varchar(30),
	dayNo varchar(25),
	date_val date 
);
