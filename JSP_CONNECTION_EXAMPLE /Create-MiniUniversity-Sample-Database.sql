
--Department(DeptCode, Name)

Create Table Department
( 
DeptCode nchar(2) Primary Key,
Name nvarchar(100)
)

--Student(SSN, Name, City, Age, Major)

Create Table Student
(
SSN nchar(14) primary key,
Name nvarchar(100),
City nVarchar(50),
Age int,
Major nchar(2) References Department(DeptCode),
Password nchar(8) not null
)

--Course(CrsCode, Name)

Create Table Course
(
CrsCode nchar(10) primary key,
Name nvarchar(100),
)
--Registered(SSN, CrsCode, Semester, Year)

Create Table Registered
(
SSN nChar(14) REFERENCES Student(SSN),
CrsCode nchar(10) REFERENCES Course(CrsCode),
Semester nChar(10),
Year int
primary key (SSN, CrsCode),
)

Insert Into Department values ('IS','Information Systems');
Insert Into Department values ('CS','Computer Science');
Insert Into Department values ('IT','Information Technology');
Insert Into Department values ('DS','Decision Support');

Insert Into Course Values ('CS112','Programming 1');
Insert Into Course Values ('CS213','Programming 2');
Insert Into Course Values ('DS425','Logistics Management');
Insert Into Course Values ('DS241','Modeling and Simulation');
Insert Into Course Values ('IS221','Database Systems1');
Insert Into Course Values ('IS312','Database Systems2');
Insert Into Course Values ('IT111','Electronics 1');
Insert Into Course Values ('IT112','Electronics 2');

Insert Into Student Values ('101','Ahmed','Cairo',17,'IS',12345678);
Insert Into Student Values ('102','Ayman','Giza',16,'CS',12345678);
Insert Into Student Values ('103','Ibrahim','Giza',18,'IS',12345678);
Insert Into Student Values ('104','Ibrahim','Fayoum',18,'DS',12345678);
Insert Into Student Values ('105','Mona','Cairo',16,'IT',12345678);
Insert Into Student Values ('106','Nahla','Giza',16,'IS',12345678);
Insert Into Student Values ('107','Sally','Giza',19,'CS',12345678);
Insert Into Student Values ('108','Sameh','Alexandria',20,'CS',12345678);
Insert Into Student Values ('109','Tarek','Giza',17,'IT',12345678);
Insert Into Student Values ('110','Wafaa','Cairo',17,'IS',12345678);


Insert Into Registered Values ('101','IS221','Fall',2011);
Insert Into Registered Values ('101','IS312','Spring',2012);
Insert Into Registered Values ('101','CS112','Spring',2011);
Insert Into Registered Values ('102','IS221','Fall',2012);
Insert Into Registered Values ('102','CS112','Spring',2011);
Insert Into Registered Values ('103','IS221','Spring',2012);
Insert Into Registered Values ('103','CS112','Fall',2011);
Insert Into Registered Values ('104','IS221','Fall',2011);
Insert Into Registered Values ('104','DS241','Fall',2011);
Insert Into Registered Values ('105','IS221','Spring',2012);
Insert Into Registered Values ('106','IS221','Summer',2012);
Insert Into Registered Values ('106','CS213','Spring',2011);
Insert Into Registered Values ('109','IT111','Summer',2010);
Insert Into Registered Values ('109','IS221','Fall',2010);
Insert Into Registered Values ('110','IS221','Fall',2012);

