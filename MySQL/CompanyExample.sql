create schema if not exists company;
use company;

create table employee (
	Fname varchar(15) NOT NULL,
	Minit char,
	Lname varchar(15) NOT NULL,
	Ssn char(9) NOT NULL,
	Bdate date,
	Address varchar(30),
	Sex char,
	Salary decimal(10,2),
	Super_ssn char(9),
	Dno int NOT NULL,
	primary key (Ssn)
);

create table departament(
	Dname varchar(15) NOT NULL,
    Dnumber int NOT NULL,
    Mgr_ssn char(9) NOT NULL,
    Mgr_start_date date,
    Dept_create_date date,
    primary key (Dnumber),
    unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

create table dept_locations(
	Dnumber int NOT NULL,
    Dlocation varchar(15) NOT NULL,
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references departament(Dnumber)
);

create table project(
	Pname varchar(15) NOT NULL,
    Pnumber int NOT NULL,
    Plocation varchar(15),
    Dnum int NOT NULL,
    primary key (Pnumber),
    unique (Pname),
    foreign key (Dnum) references departament(Dnumber)
);

create table works_on(
	Essn char(9) NOT NULL,
	Pno int NOT NULL,
    Hours decimal(3,1) NOT NULL,
    primary key (Essn, Pno),
    foreign key (Essn) references employee(SSn),
    foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) NOT NULL,
    Dependent_name varchar(15) NOT NULL,
    Sex char, -- F ou M
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references employee(Ssn)
);

show tables;
desc dependent;