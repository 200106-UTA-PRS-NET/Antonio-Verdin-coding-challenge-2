---Creating Tables
Create Table Department(
    ID INTEGER not null IDENTITY(1,1),
    _NAME varchar(50),
    _Location VARCHAR(50)
)
Alter Table Department Add Primary Key (ID)
Create Table Employee(
    ID INTEGER not null IDENTITY(1,1),
    FirstName varchar(50),
    LastName varchar(50),
    SSN bigint not null,
    deptid int not null,
    PRIMARY KEY(ID),
    FOREIGN KEY(deptid) REFERENCES Department(id)
)
Create Table EmployeeDetails(
    ID INT not null IDENTITY(1,1),
    EmployeeID int,
    Salary money,
    Address1 varchar(100),
    Address2 VARCHAR(100),
    City VARCHAR(50),
    _State nchar(2),
    Country varchar(50),
    PRIMARY KEY(ID),
    FOREIGN KEY(EmployeeID) REFERENCES Employee(ID)
)
--Adding Three Records to each Table--

INSERT into Department VALUES('IT', 'Seattle')
Insert into Department values('HR', 'San Antonio')
INsert into Department values('Sales', 'New York')

Insert into dbo.Employee values ('Sam','Smit',1234567,1)
Insert into dbo.Employee values('Janie','Doe',8978484,2)
Insert into dbo.Employee values('Alan','Watson',7654321,3)

Insert into dbo.EmployeeDetails values(1,500000,'100','South Bend Rd','Seattle','WA','United States')
Insert into dbo.EmployeeDetails values(2,600000,'100','New Rd','San Antonio','TX','United States')
Insert into dbo.EmployeeDetails values(4,1500000,'100','Earth Bend Rd','New York','NY','United States')

---Adding Marketing Department
Insert into Department values('Marketting', 'Boston')
--determining department id for marketting
select * from Department where _NAME  = 'Marketting'
---Adding tina to department 4 which is marketing
Insert into dbo.Employee values ('Tina','Smith',874550167,4)
Insert into dbo.EmployeeDetails values (5,1500000,'100','Earth Bend Rd','New York','NY','United States')
--View all employees in marketing
Select FirstName,LastName,_NAME
FROM Employee a INNER join dbo.Department b on a.deptid = b.ID Where _NAME = 'Marketting'
--Report of salary from marketing
Select SUM(Salary) FROM dbo.EmployeeDetails a inner join dbo.Employee b on  a.EmployeeID =b.ID WHERE deptid = 4

Select * FROM dbo.Employee inner join dbo.Employee b on  E =b.ID Group by deptid
--Report for each department
Select count(*) As 'Department Count' FROM dbo.EmployeeDetails a inner join dbo.Employee b on  a.EmployeeID =b.ID Group BY deptid 
--Change Tina salary to 900000
UPDATE dbo.EmployeeDetails
set Salary = 90000
where EmployeeID =5

---* inner query to join department location with department ID
Select FirstName,LastName,_NAME
FROM Employee a INNER join dbo.Department b on a.deptid = b.ID Where _NAME = 'Marketting'