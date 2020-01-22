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

INSERT into Department VALUES('IT', 'Seattle')
Insert into Department values('HR', 'San Antonio')
INsert into Department values('Sales', 'New York')

Insert into dbo.Employee values ('Sam','Smit',1234567,1)
Insert into dbo.Employee values('Janie','Doe',8978484,2)
Insert into dbo.Employee values('Alan','Watson',7654321,3)

Insert into dbo.EmployeeDetails values(1,500000,'100','South Bend Rd','Seattle','WA','United States')
Insert into dbo.EmployeeDetails values(2,600000,'100','New Rd','San Antonio','TX','United States')
Insert into dbo.EmployeeDetails values(4,1500000,'100','Earth Bend Rd','New York','NY','United States')

