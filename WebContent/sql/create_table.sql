create table member(
	email VARCHAR(50) PRIMARY KEY,
	name VARCHAR(50),
	department VARCHAR(50),
	userpw VARCHAR(200)
);

create table friends(
	useremail VARCHAR(50),
	friendemail VARCHAR(50)
);

create table CategoryForBook(
	no int(4) auto_increment,
	title varchar(100)
);