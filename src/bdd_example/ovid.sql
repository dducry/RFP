-- create tables

drop table if exists memberof;
drop table if exists enrolled;
drop table if exists studentgroup;
drop table if exists course;
drop table if exists student;


create table student (
  LastName      varchar(40),
  FirstName     varchar(40),
  SID           integer,
  SSN           integer,
  Career        varchar(4),
  Program       varchar(10),
  City      varchar(40),
  Started       integer,

  primary key (SID)
);

create table course (
  CID   integer,
  CourseName    varchar(40),
  Department    varchar(4),
  CourseNr       char(3),

  primary key (CID)
);

create table studentgroup (
  Name  varchar(40),
  PresidentID   integer,
  Founded       integer,
  
  primary key (Name)
);

create table enrolled (
  StudentID     integer,
  CourseID      integer,
  Quarter       varchar(6),
  Year          integer,
  
  primary key (StudentID, CourseID),
  foreign key (StudentID) references student(SID),
  foreign key (CourseID) references course(CID)
);

create table memberof (
  StudentID     integer,
  GroupName      varchar(40),
  Joined          integer,
  
  primary key (StudentID, GroupName),
  foreign key (StudentID) references student(SID),
  foreign key (GroupName) references studentgroup(Name)
);

-- populate tables

delete from enrolled;
delete from memberof;
delete from studentgroup;
delete from student;
delete from course;


insert into student
    values ( 'Brennigan', 'Marcus', 90421, 987654321, 'UGRD', 'COMP-GPH', 'Evanston', 2001 );
insert into student
    values ( 'Patel', 'Deepa', 14662, null, 'GRD', 'COMP-SCI', 'Evanston', 2003 );
insert into student
    values ( 'Snowdon', 'Jonathan', 08871, 123123123, 'GRD', 'INFO-SYS', 'Springfield', 2005 );
insert into student
    values ( 'Starck', 'Jason', 19992, 789789789, 'UGRD', 'INFO-SYS', 'Springfield', 2003 );
insert into student
    values ( 'Johnson', 'Peter', 32105, 123456789, 'UGRD', 'COMP-SCI', 'Chicago', 2004 );
insert into student
    values ( 'Winter', 'Abigail', 11035, 111111111, 'GRD', 'PHD', 'Chicago', 2003 );
insert into student
    values ( 'Patel', 'Prakash', 75234, null, 'UGRD', 'COMP-SCI', 'Chicago', 2001 );
insert into student
    values ( 'Snowdon', 'Jennifer', 93321, 321321321, 'GRD', 'COMP-SCI', 'Springfield', 2004 );

insert into course
    values ( 1020, 'Theory of Computation', 'CSC', 489);
insert into course
    values ( 1092, 'Cryptography', 'CSC', 440);
insert into course
    values ( 3201, 'Data Analysis', 'IT', 223);
insert into course
    values ( 9219, 'Desktop Databases', 'IT', 240);
insert into course
    values ( 3111, 'Theory of Computation', 'CSC', 389);
insert into course
    values ( 8772, 'Survey of Computer Graphics', 'GPH', 425);
insert into course
    values ( 2987, 'Topics in Digital Cinema', 'DC', 270);
    
insert into studentgroup
    values ('Computer Science Society', 75234, 1999);
insert into studentgroup
    values ('Robototics Society', null, 1998);
insert into studentgroup
    values ('HerCTI', 93321, 2003);
insert into studentgroup
    values ('DeFrag', 90421, 2004);
    
insert into enrolled
    values (11035, 1020, 'Fall', 2005);
insert into enrolled
    values (11035, 1092, 'Fall', 2005);
insert into enrolled
    values (75234, 3201, 'Winter', 2006);
insert into enrolled
    values (08871, 1092, 'Fall', 2005);
insert into enrolled
    values (90421, 8772, 'Spring', 2006);
insert into enrolled
    values (90421, 2987, 'Spring', 2006);
    
insert into memberof
    values (75234, 'DeFrag', 2005);
insert into memberof
    values (11035, 'HerCTI', 2004);
insert into memberof
    values (93321, 'HerCTI', 2005);
insert into memberof
    values (75234, 'Computer Science Society', 2002);

