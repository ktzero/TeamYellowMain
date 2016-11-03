drop table if exists userinfo;
drop table if exists date_map;
drop table if exists food;
drop table if exists food_category;
drop table if exists exercise_tracking;
drop table if exists exercise;
drop table if exists exercise_category;

drop table if exists exercise_category;

drop table if exists userinfo;

create table userinfo(
	id int primary key auto_increment,
	firstname varchar(30) not null,
	lastname varchar(30) not null,
	start_date date,
	username varchar(15),
	password varchar(8),
	routine_created boolean,
	caloriesPerDay int
	);
-- DATE 3 bytes In the format of YYYY-MM-DD

	insert into userinfo(id, firstname, lastname, start_date, username, password, routine_created, caloriesPerDay) 
    values(1, 'Karen','Reiter', '2016-08-15', 'karen123', 'yellow', true, 1250);
	insert into userinfo(id, firstname, lastname, start_date, username, password, routine_created, caloriesPerDay)
    values(2, 'Kevin','Tran', '2016-08-15', 'kevin123', 'yellow', true, 2000);
	insert into userinfo(id, firstname, lastname, start_date, username, password, routine_created, caloriesPerDay)
    values(3, 'Arun','Somasundaram', '2016-08-15', 'arun123', 'yellow', true, 10000);
	insert into userinfo(id, firstname, lastname, start_date, username, password, routine_created, caloriesPerDay)
    values(4, 'Michael','Sykes', '2016-08-15', 'michael123', 'yellow', true, 1500);

drop table if exists exercise_category;

create table exercise_category(
	id int primary key auto_increment,
	description varchar(30),
	url varchar(500),
	explaination varchar(1000)
	);

INSERT exercise_category( description, url, explaination) VALUES('CHEST',"/images/Chest.jpg",
"The chest is such a noticeable muscle group. it is always first to walk into a room and therefore it is very important in a balanced physique to have an impressive big chest. The chest is used in pushing and wrapping your arms round something. The chest is made up of two main muscles.The Pectoralis major is that big muscle that covers each half of the front of your chest. One of its jobs is to turn your arm inward. Its other job is to help pull your arm forward and down. Pectoralis minor is directly under pectoralis major. It's attached to your third, fourth and fifth ribs at the bottom, and at the top it's attached to the front of your shoulder blade. It helps pull your shoulder blade down, and it helps hold your shoulder down when you have to push down with your hands.");

INSERT exercise_category( description,url, explaination) VALUES('BACK',"/images/Back.jpg",
"The back isn't only one of the body's biggest and strongest bodyparts, it's also the most complicated in terms of being a series of interconnected muscle groups. For the purposes of this feature we're dividing the back into its four main regions: 1) the upper and outer lats, 2) the lower lats, 3) the middle back and 4) the lower back. Each area requires specific stimulation via the exercises and angles of attack used, and we'll show you the two best exercises for each.");

INSERT exercise_category( description,url, explaination) VALUES('LEGS',"/images/Legs.jpg",
"Supporting, balancing, and propelling the body is the work of the muscular system of the legs and feet. From the large, strong muscles of the buttocks and legs to the tiny, fine muscles of the feet and toes, these muscles can exert tremendous power while constantly making small adjustments for balance – whether the body is at rest or in motion.");

INSERT exercise_category( description,url, explaination) VALUES('ARMS',"/images/Arms.jpg",
"Everyone loves to flex their biceps, but Arms means more than biceps. The anterior component of the upper arm contains the biceps, coracobrachialis and brachialis muscles. Together, these flex the arm at the shoulder and elbow. The posterior component holds the triceps, which are antagonistic to the anterior muscles. The lower arm holds muscles that flex, abduct and supinate the hand, as well as many of the relatively small muscles and tendons that control individual fingers.");
INSERT exercise_category( description,url, explaination) VALUES('CORE',"/images/Core.jpg",
"The major muscles involved include the pelvic floor muscles, multifidus, transverse abdominis, rectus abdominis, internal and external obliques, erector spinae - particularly the longissimus thoracis, as well as the diaphragm. The minor core muscles involved include the glueteus maximus, latissimus dorsi, and trapezius. The function of the core is to stabilize the person's thorax and pelvis during dynamic movement, as well as to provide internal pressure in order to expel substances.");

drop table if exists exercise;

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
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('InclinePress',"Works chest muscle",1,3,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('DeclinePress',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PushUps',"Works chest muscle",1,2,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('Dips',"Works chest muscle",1,1,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PullOver',"Works chest muscle",1,1,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('PullUps',"Works Back muscle",2,3,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
insert into exercise(exercise_name,exercise_desc,category_id,intensity,url) values('WideGripPullDown',"Works Back muscle",2,1,"https://www.youtube.com/watch?v=rT7DgCr-3pg");
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

	INSERT food_category(id, description) VALUES(1, 'BREAKFAST');
	INSERT food_category(id,  description) VALUES(2, 'LUNCH');
	INSERT food_category(id,  description) VALUES(3, 'DINNER');
	INSERT food_category(id,  description) VALUES(4, 'SNACK');
	INSERT food_category(id,  description) VALUES(5, 'CONDIMENT');
	INSERT food_category(id,  description) VALUES(6, 'DESSERT');
	INSERT food_category(id,  description) VALUES(7, 'SIDE');
	INSERT food_category(id,  description) VALUES(8, 'BEVERAGE');

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
	insert into food(description,calories, protein, fat, carbs, category_id) values('Larabar',100,10,1,7, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CEREAL 1 OZ' , 135 , 3 , 6 , 18, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SALAD DRSNG-LOCAL1 TBSP' , 25 , 0 , 2 , 2, 5);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SALAD DRSNG-REGLR1 TBSP' , 60 , 0 , 6 , 2, 5);
	insert into food(description,calories, protein, fat, carbs, category_id) values('40% BRAN FLAKES- POST 1 OZ' , 90 , 3 , 0 , 22, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ALFALFA SEEDS- SPROUTED- RAW 1 CUP' , 10 , 1 , 0 , 1, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ALL-BRAN CEREAL 1 OZ' , 70 , 4 , 1 , 21, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ALMONDS- SLIVERED 1 CUP' , 795 , 27 , 70 , 28, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ALMONDS- WHOLE 1 OZ' , 165 , 6 , 15 , 6, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ANGELFOOD CAKE- FROM MIX 1 PIECE' , 125 , 3 , 0 , 29, 6);
	insert into food(description,calories, protein, fat, carbs, category_id) values('APPLE JUICE- CANNED 1 CUP' , 115 , 0 , 0 , 29, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('APPLE PIE 1 PIECE' , 405 , 3 , 18 , 60, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('APPLES- RAW- PEELED- SLICED 1 CUP' , 65 , 0 , 0 , 16, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('APPLESAUCE- CANNED- SWEETENED 1 CUP' , 195 , 0 , 0 , 51, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('APRICOTS- DRIED- COOKED-UNSWTN1 CUP' , 210 , 3 , 0 , 55, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ARTICHOKES- GLOBE- COOKED- DRN1 ARTCHK' , 55 , 3 , 0 , 12, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ASPARAGUS- CKD FRM FRZ-DR-SPER4 SPEARS' , 15 , 2 , 0 , 3, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('AVOCADOS- CALIFORNIA 1 AVOCDO' , 305 , 4 , 30 , 12, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BAGELS- EGG 1 BAGEL' , 200 , 7 , 2 , 38, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BAGELS- PLAIN 1 BAGEL' , 200 , 7 , 2 , 38, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BANANAS 1 BANANA' , 105 , 1 , 1 , 27, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BARBECUE SAUCE 1 TBSP' , 10 , 0 , 0 , 2, 5);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BARLEY- PEARLED-LIGHT- UNCOOKD1 CUP' , 700 , 16 , 2 , 158, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BEAN SPROUTS- COOKD-DRAN1 CUP' , 25 , 3 , 0 , 5, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BEAN WITH BACON SOUP- CANNED 1 CUP' , 170 , 8 , 6 , 23, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BEEF AND VEGETABLE STEW-HM RCP1 CUP' , 220 , 16 , 11 , 15, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BEEF POTPIE- HOME RECIPE 1 PIECE' , 515 , 21 , 30 , 39, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BEEF- CKD-BTTM ROUND-LEAN ONLY2.8 OZ' , 175 , 25 , 8 , 0, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BEER- LIGHT 12 FL OZ' , 95 , 1 , 0 , 5, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BEER- REGULAR 12 FL OZ' , 150 , 1 , 0 , 13, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BEET GREENS- COOKED- DRAINED 1 CUP' , 40 , 4 , 0 , 8, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BLACK BEANS- DRY- COOKED-DRAND1 CUP' , 225 , 15 , 1 , 41, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BLACKBERRIES- RAW 1 CUP' , 75 , 1 , 1 , 18, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BLUE CHEESE 1 OZ' , 100 , 6 , 8 , 1, 5);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BLUEBERRIES- FROZEN- SWEETENED1 CUP' , 185 , 1 , 0 , 50, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BOLOGNA 2 SLICES ', 180 , 7 , 16 , 2, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BRAN MUFFINS- FROM COMMERL MIX1 MUFFIN' , 140 , 3 , 4 , 24, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BRAUNSCHWEIGER 2 SLICES' , 205 , 8 , 18 , 2, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BRAZIL NUTS 1 OZ' , 185 , 4 , 19 , 4, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BROCCOLI- FRZN- COOKED- DRANED1 CUP' , 50 , 6 , 0 , 10, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BROWN AND SERVE SAUSAGE-BRWND 1 LINK' , 50 , 2 , 5 , 0, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BROWNIES W/ NUTS-FRM HOME RECP1 BROWNE' , 95 , 1 , 6 , 11, 6);
	insert into food(description,calories, protein, fat, carbs, category_id) values('BUTTER- UNSALTED 1/2 CUP' , 810 , 1 , 92 , 0, 5);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CABBAGE- CHINESE- PAK-CHOI-CKD1 CUP' , 20 , 3 , 0 , 3, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CANTALOUP- RAW 1/2 MELN' , 95 , 2 , 1 , 22, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CAPN CRUNCH CEREAL 1 OZ' , 120 , 1 , 3 , 23, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CARROTS- RAW- GRATED 1 CUP' , 45 , 1 , 0 , 11, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CASHEW NUTS- DRY ROASTD-SALTED1 OZ' , 165 , 4 , 13 , 9, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CHEDDAR CHEESE 1 CU IN' , 70 , 4 , 6 , 0, 5);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CHEERIOS CEREAL 1 OZ' , 110 , 4 , 2 , 20, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CHEESEBURGER- 4OZ PATTY 1 SANDWH' , 525 , 30 , 31 , 40, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CHICKEN A LA KING- HOME RECIPE1 CUP' , 470 , 27 , 34 , 12, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CHICKEN NOODLE SOUP- CANNED 1 CUP' , 75 , 4 , 2 , 9, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CHICKEN- FRIED- BATTER-DRMSTCK2.5 OZ' , 195 , 16 , 11 , 6, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CHOCOLATE CHIP COOKIES-COMMRCL4 COOKIE' , 180 , 2 , 9 , 28, 6);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CHOCOLATE MILK- LOWFAT 1% 1 CUP' , 160 , 8 , 3 , 26, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('COFFEE- BREWED 6 FL OZ' , 0 , 0 , 0 , 0, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('COLLARDS- COOKED FROM FROZEN 1 CUP' , 60 , 5 , 1 , 12, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CORN CHIPS 1 OZ' , 155 , 2 , 9 , 16, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CORN FLAKES- KELLOGGS 1 OZ' , 110 , 2 , 0 , 24, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('COTTAGE CHEESE1 CUP' , 235 , 28 , 10 , 6, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CRABMEAT- CANNED 1 CUP' , 135 , 23 , 3 , 1, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CRACKED-WHEAT BREAD 1 SLICE' , 65 , 2 , 1 , 12, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('CRANBERRY JUICE COCKTAL W/VITC1 CUP' , 145 , 0 , 0 , 38, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('EGGNOG 1 CUP' , 340 , 10 , 19 , 34, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('EGGS- COOKED- FRIED 1 EGG' , 90 , 6 , 7 , 1, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('HAMBURGER- REGULAR 1 SANDWH' , 245 , 12 , 11 , 28, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ICE CREAM- VANLLA- 1 CUP' , 350 , 4 , 24 , 32, 6);
	insert into food(description,calories, protein, fat, carbs, category_id) values('LUCKY CHARMS CEREAL 1 OZ' , 110 , 3 , 1 , 23, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('OATMEAL 1 cup', 65 , 2 , 1 , 12, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ORANGE JUICE- CHILLED 1 CUP' , 110 , 2 , 1 , 25, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('PISTACHIO NUTS 1 OZ' , 165 , 6 , 14 , 7, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('PITA BREAD 1 PITA' , 165 , 6 , 1 , 33, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('PIZZA- CHEESE 1 SLICE' , 290 , 15 , 9 , 39, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('POPCORN- 1 CUP' , 135 , 2 , 1 , 30, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('POTATO CHIPS 10 CHIPS' , 105 , 1 , 7 , 10, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('POTATOES-FRENCH-FRD-FRZN-OVEN 10 STRIP' , 110 , 2 , 4 , 17, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('PRETZELS- STICK 10 PRETZ' , 10 , 0 , 0 , 2, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('PUMPKIN PIE 1 PIECE' , 320 , 6 , 17 , 37, 6);
	insert into food(description,calories, protein, fat, carbs, category_id) values('RAISIN BREAD- TOASTED 1 SLICE ', 65 , 2 , 1 , 13, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('RAISINS 1 CUP' , 435 , 5 , 1 , 115, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('RASPBERRIES- RAW 1 CUP' , 60 , 1 , 1 , 14, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('RED KIDNEY BEANS- DRY- CANNED 1 CUP' , 230 , 15 , 1 , 42, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('REFRIED BEANS- CANNED 1 CUP' , 295 , 18 , 3 , 51, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('RICE- WHITE- RAW 1 CUP' , 670 , 12 , 1 , 149, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ROAST BEEF SANDWICH 1 SANDWH' , 345 , 22 , 13 , 34, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ROOT BEER 12 FL OZ' , 165 , 0 , 0 , 42, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SALMON-3 OZ' , 150 , 18 , 8 , 0, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SALTINES 4 CRACKR' , 50 , 1 , 1 , 9, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SAUERKRAUT- CANNED 1 CUP' , 45 , 2 , 0 , 10, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SHAKES- THICK- CHOCOLATE 10 OZ' , 335 , 9 , 8 , 60, 6);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SHEETCAKE-W/O FRSTNG-HOMERECIP1 PIECE ', 315 , 4 , 12 , 48, 6);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SNACK CAKES-DEVILS FOOD-CREMFLSM CAKE' , 105 , 1 , 4 , 17, 6);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SNACK TYPE CRACKERS 1 CRACKR ', 15 , 0 , 1 , 2, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SPAGHETTI-MEATBALLS-TOMSAC-CND1 CUP' , 260 , 12 , 10 , 29, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('SPINACH- RAW 1 CUP ', 10 , 2 , 0 , 2, 7);
	insert into food(description,calories, protein, fat, carbs, category_id) values('STRAWBERRIES- RAW 1 CUP' , 45 , 1 , 1 , 10, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('TUNA- CANND- DRND-WATR- WHITE 3 OZ ', 135 , 30 , 1 , 0, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('TURKEY- ROASTED- LIGHT MEAT 2 PIECES' , 135 , 25 , 3 , 0, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('TURNIPS- COOKED- DICED 1 CUP' , 30 , 1 , 0 , 8, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('VANILLA WAFERS 10 COOKIE ', 185 , 2 , 7 , 29, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('VEAL CUTLET- MED FAT-BRSD-BRLD3 OZ ', 185 , 23 , 9 , 0, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('VEAL RIB- MED FAT- ROASTED 3 OZ' , 230 , 23 , 14 , 0, 3);
	insert into food(description,calories, protein, fat, carbs, category_id) values('VEGETARIAN SOUP- CANNED 1 CUP' , 70 , 2 , 2 , 12, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('WAFFLES- FROM MIX 1 WAFFLE' , 205 , 7 , 8 , 27, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('WHEAT BREAD 1 SLICE ', 65 , 2 , 1 , 12, 2);
	insert into food(description,calories, protein, fat, carbs, category_id) values('WHEAT- THIN CRACKERS 4 ' , 35 , 1 , 1 , 5, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('WHEATIES CEREAL 1 OZ' , 100 , 3 , 0 , 23, 1);
	insert into food(description,calories, protein, fat, carbs, category_id) values('WINE 3.5 F OZ ' , 75 , 0 , 0 , 3, 8);
	insert into food(description,calories, protein, fat, carbs, category_id) values('YOGURT', 140 , 8 , 7 , 11, 4);
	insert into food(description,calories, protein, fat, carbs, category_id) values('ZUCHINI- 1/2 CUP' , 16 , 1 , 0 , 3, 7);



drop table if exists exercise_tracking;

create table exercise_tracking (

    id int primary key auto_increment,
    user_id varchar(30),
    dayNo varchar(25),
    exercise_id int,
    numberOfSets int,
    numberOfReps int,
    timeInMins int,
    todays_date date,
    complete boolean,
    foreign key (exercise_id)
      references exercise(id)

    );
insert into exercise_tracking (id,user_id, dayNo, exercise_id, numberOfSets, numberOfReps, timeInMins, todays_date,complete)
 values(1, '1' , '1' , 1 , 4, 10, 60, '2016-10-31', true);
 insert into exercise_tracking (id,user_id, dayNo, exercise_id, numberOfSets, numberOfReps, timeInMins, todays_date,complete)
 values(2, '1' , '1' , 1 , 4, 10, 60, '2016-11-03', true);
 insert into exercise_tracking (id,user_id, dayNo, exercise_id, numberOfSets, numberOfReps, timeInMins, todays_date,complete)
 values(3, '1' , '1' , 1 , 4, 10, 60, '2016-10-30', true);
 

create table date_map(
	id int primary key auto_increment,
	user_id varchar(50),
	dayNo varchar(50),
	date_val date

	);