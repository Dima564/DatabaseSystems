
create database boost;
use boost;


/**************************************************************************************
	Users table
**************************************************************************************/
create table Users(
	UserId int auto_increment primary key not null, 
	Email char(255) not null,
	Username char(255),
	FirstName char(255),
	LastName char(255),
	Password char(255) not null, -- hashed
	Constraint uc_username unique (Username)
);


/**************************************************************************************
	Projects table
**************************************************************************************/
create table Projects(
	project_id int auto_increment primary key,
	creator int not null,
	title char(255) not null,
	description text(1023),
	duedate date,
	duetime time,
	Constraint fk_creator foreign key (creator) references Users(UserId)
);


/**************************************************************************************
	Goals table
**************************************************************************************/
create table Goals(
	goal_id int auto_increment primary key,
	project int not null,
	title  char(255) not null,
	description text(1023), 
	duedate date,
	duetime time,
	Constraint fk_project foreign key (project) references Projects(project_id)
);



/**************************************************************************************
	ToDoItems table
**************************************************************************************/
create table ToDoItems (
	todo_id int auto_increment primary key,
	user int,
	goal int not null,
	title char(255) not null,
	isDone int not null,
	Constraint fk_goal foreign key (goal) references Goals(goal_id)
);


/**************************************************************************************
	Comments table
**************************************************************************************/
create table Comments (
	comment_id int auto_increment primary key,
	author int not null,
	project int not null,
	title char(255),
	message text(1023) not null,
	Constraint fk_author foreign key (author) references Users(UserId),
	Constraint fk_project_id foreign key (project) references Projects(project_id)
);


/**************************************************************************************
	ToDoItems table
**************************************************************************************/
create table InstantMessages (
	message_id int auto_increment primary key,
	author char(255) not null,
	goal int not null,
	message text(1023),
	Constraint fk_author_id foreign key (author) references Users(Username),
	Constraint fk_goal_id foreign key (goal) references Goals(goal_id)
);


/**************************************************************************************
	Participants table -- for many-to-many relation
**************************************************************************************/
create table Participants (
	user int not null,
	project int not null,
	Constraint fk_participants_user foreign key(user) references Users(UserId),
	Constraint fk_participants_project foreign key (project) references Projects(project_id)
);

-- TODO ALTER + REPORT WITH CODE


/**************************************************************************************
	Populating tables
**************************************************************************************/
insert into Users (Email, Username, FirstName, LastName, Password)
	values('email1@gmail.com','dima','Dima','Kovalenko','1');
insert into Users (Email, Username, FirstName, LastName, Password)
	values('email2@gmail.com','andriy','Andrew','Bas','1');
insert into Users (Email, Username, FirstName, LastName, Password)
	values('email3@gmail.com','alex','Alex','Parienko','1');
insert into Users (Email, Username, FirstName, LastName, Password)
	values('email4@gmail.com','sergey','Serhey','Onoprienko','1');
insert into Users (Email, Username, FirstName, LastName, Password)
	values('email5@gmail.com','denis','Denis','Ivanets','1');
insert into Users (Email, Username, FirstName, LastName, Password)
	values('email6@gmail.com','vova','Vova','Kucherenko','1');

insert into Projects (creator, title,description , duedate)
	values (1,'Booster','Description of booster project','2014-06-01');
insert into Projects (creator, title,description , duedate)
	values (1,'Dima\s CP','The task is just stupid.','2014-05-12');
insert into Projects (creator, title,description , duedate)
	values (2,'Anyway','Parse.com example project','2014-04-30');
insert into Projects (creator, title,description)
	values (2,'Locations game','Another time-wasting task.');
insert into Projects (creator, title,description)
	values (2,'Pointer','Another time-wasting task.');

insert into Goals (project,title)
	values(1,'Decide whther we should do it');
insert into Goals (project,title)
	values(1,'Write use cases');
insert into Goals (project,title)
	values(1,'Start writing code');
insert into Goals (project,title)
	values(1,'Analyse progress');
insert into Goals (project,title)
	values(1,'Prepare for second iteration');

insert into ToDoItems(goal, title, isDone)
	values (2,'use case1',0);
insert into ToDoItems(goal, title, isDone)
	values (2,'use case2',0);
insert into ToDoItems(goal, title, isDone)
	values (2,'use case3',0);
insert into ToDoItems(goal, title, isDone)
	values (2,'use case4',1);
insert into ToDoItems(goal, title, user, isDone)
	values (2,'use case5',1,0);
insert into ToDoItems(goal, title, user, isDone)
	values (2,'use case5',2,0);
insert into ToDoItems(goal, title, user, isDone)
	values (2,'use case5',3,0);


insert into Comments(author,project,title,message)
	values(1,1,'comment1','ok guys, let\'s do something cool, Im tired of this crap @ kpi');
insert into Comments(author,project,title,message)
	values(3,1,'comment2','ToDO manager, I\'ve been thinking about it for a while');
insert into Comments(author,project,title,message)
	values(2,1,'comment3','Check out Basecamp');
insert into Comments(author,project,title,message)
	values(6,1,'comment4','Basecamp is 150$ per month, our app might cost 1$ lifetime license');
insert into Comments(author,project,title,message)
	values(1,1,'comment5','Hmm, sound good, lets name our first child');
insert into Comments(author,project,title,message)
	values(2,1,'comment6','That sound gay, dude.');
insert into Comments(author,project,title,message)
	values(5,1,'comment7','Ahhahahahhahahh xD');
insert into Comments(author,project,title,message)
	values(1,1,'comment8','shut up, im being serious');
insert into Comments(author,project,title,message)
	values(2,1,'comment9','BOOSTER, ');

insert into Participants (user, project)
	values(1,1);
insert into Participants (user, project)
	values(2,1);
insert into Participants (user, project)
	values(3,1);
insert into Participants (user, project)
	values(4,1);
insert into Participants (user, project)
	values(5,1);
insert into Participants (user, project)
	values(6,1);
insert into Participants (user, project)
	values(2,3);
insert into Participants (user, project)
	values(1,3);
	/*
insert into Participants (user, project)
	values(3,3);
insert into Participants (user, project)
	values(4,3);
	*/


/*
select * from Users;
select * from Projects;
select * from Goals;
select * from ToDoItems;
select * from Comments;

*/

-- select title from Projects where project_id not in (select project from Participants);
/*
-- 3.1
-- create simple view
create view user_view as
select FirstName, LastName, Email 
from Users; 

select * from user_view;

-- 3.2 
-- select user names ordered by user id 
select FirstName from Users order by UserId asc;
-- obvious
select Email from Users where Userid < 5;
*/

/*
select FirstName, LastName from Users where UserId in
(select user from ToDoItems where user is not null);

select FirstName, LastName from
Users join ToDoItems 
on Users.UserId = ToDoItems.user;
*/

select FirstName, LastName from Users where UserId IN
(SELECT user FROM ToDoItems WHERE ToDoItems.goal IN 
(SELECT goal_id FROM Goals WHERE Goals.project IN 
(SELECT Projects.project_id FROM Projects WHERE Projects.title = 'Booster')) 
AND user is not null);


select FirstName, LastName from Users where UserId IN 

-- TODO joins
/*
-- 3.3
-- all users that have ever commented
select FirstName from Users where UserId in (select author from Comments order by comment_id) ;
-- all projects that have a due date
select * from Projects where duedate is not null;
-- all projects that have people involved in them
select title from Projects where project_id not in (select project from Participants);

-- 3.4
-- username and comment
select Users.Username, Comments.message
from Comments 
inner join Users
on Users.Userid = Comments.author order by Comments.comment_id;


-- 
select * from Projects left join Participants 
on Projects.project_id = Participants.project;


-- 
select * from Projects right join Participants 
on Projects.project_id = Participants.project;

-- 3.5
-- union all 



(select * from Users where UserId < 3)
union 
(select * from Users where UserId > 3);
*/





-- 4.1 Print all projects along with number of participants (with ability to show users)
SELECT title, COUNT(Users.Username) AS NumberOfParticipants
FROM
Projects LEFT JOIN 
(Participants JOIN Users 
ON Participants.user = Users.UserId)
ON Participants.project = Projects.project_id
GROUP BY Projects.title;


-- Print all projects which have people involved in them along with number of participants
SELECT title, COUNT(Users.Username) AS NumberOfParticipants
FROM
Projects JOIN 
(Participants JOIN Users 
ON Participants.user = Users.UserId)
ON Participants.project = Projects.project_id
GROUP BY Projects.title;


-- 4.2  -- Maximum number of participants in some project
SELECT MAX(NumberOfParticipants) FROM
(SELECT title, COUNT(Users.Username) AS NumberOfParticipants
FROM
Projects JOIN 
(Participants JOIN Users 
ON Participants.user = Users.UserId)
ON Participants.project = Projects.project_id
GROUP BY Projects.title) as IKnowThisSucks;


-- Print projects which have number of participants > 3
SELECT Title FROM (
SELECT Projects.title as Title, Participants.user
FROM Projects LEFT JOIN Participants 
ON Participants.project = Projects.project_id
GROUP BY Projects.title
HAVING COUNT(Participants.user) > 3) as SomeTable;

-- 4.3

SELECT * FROM ToDoItems;

UPDATE ToDoItems
SET isDone=1
WHERE title='use case1';

SELECT * FROM ToDoItems;

DELETE FROM ToDoItems
WHERE isDone=1;

SELECT * FROM ToDoItems;
*/

-- Naming convention - ?



drop table Participants;
drop table InstantMessages;
drop table Comments;
drop table ToDoItems;
drop table Goals;
drop table Projects;
drop table Users;

drop database boost;
