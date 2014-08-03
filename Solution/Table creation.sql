CREATE TABLE Depart_profess ( 
	ID_dep_pro int NOT NULL,
	Departament int NOT NULL,
	Professor int NOT NULL,
	Position int NOT NULL
)
;

CREATE TABLE Departments ( 
	ID_Department int NOT NULL,
	Name nvarchar(10) NOT NULL
)
;

CREATE TABLE General ( 
	ID int NOT NULL,
	Day tinyint NOT NULL,
	NumberOfLesson tinyint NOT NULL,
	Professor int NOT NULL,
	Subject int NOT NULL,
	Group int NOT NULL
)
;

CREATE TABLE Groups ( 
	ID_Group int NOT NULL,
	Name nvarchar(50) NOT NULL,
	YearStart int NOT NULL
)
;

CREATE TABLE People ( 
	ID_Human int NOT NULL,
	FirstName nvarchar(50),
	LastName nvarchar(50),
	MiddleName nvarchar(50),
	Rank int NOT NULL,
	Departament int NOT NULL
)
;

CREATE TABLE Positions ( 
	ID_Position int NOT NULL,
	Name nvarchar(50) NOT NULL
)
;

CREATE TABLE Ranks ( 
	ID_Rank int NOT NULL,
	Name nvarchar(50)
)
;

CREATE TABLE Subjects ( 
	ID_Subject int NOT NULL,
	Name nvarchar(50) NOT NULL
)
;

CREATE TABLE Week ( 
	ID_Day tinyint NOT NULL,
	NameOfDay nvarchar(15) NOT NULL
)
;


ALTER TABLE Depart_profess
	ADD CONSTRAINT UQ_Depart_profess_ID_dep_pro UNIQUE (ID_dep_pro)
;

ALTER TABLE Departments
	ADD CONSTRAINT UQ_Departments_ID_Department UNIQUE (ID_Department)
;

ALTER TABLE Departments
	ADD CONSTRAINT UQ_Departments_Name UNIQUE (Name)
;

ALTER TABLE General
	ADD CONSTRAINT UQ_General_ID UNIQUE (ID)
;

ALTER TABLE Groups
	ADD CONSTRAINT UQ_Groups_ID_Group UNIQUE (ID_Group)
;

ALTER TABLE People
	ADD CONSTRAINT UQ_People_ID_Human UNIQUE (ID_Human)
;

ALTER TABLE Positions
	ADD CONSTRAINT UQ_Positions_ID_Position UNIQUE (ID_Position)
;

ALTER TABLE Positions
	ADD CONSTRAINT UQ_Positions_Name UNIQUE (Name)
;

ALTER TABLE Ranks
	ADD CONSTRAINT UQ_Ranks_ID_Rank UNIQUE (ID_Rank)
;

ALTER TABLE Ranks
	ADD CONSTRAINT UQ_Ranks_Name UNIQUE (Name)
;

ALTER TABLE Subjects
	ADD CONSTRAINT UQ_Subjects_ID_Subject UNIQUE (ID_Subject)
;

ALTER TABLE Subjects
	ADD CONSTRAINT UQ_Subjects_Name UNIQUE (Name)
;

ALTER TABLE Week
	ADD CONSTRAINT UQ_Week_ID_Day UNIQUE (ID_Day)
;

ALTER TABLE Week
	ADD CONSTRAINT UQ_Week_NameOfDay UNIQUE (NameOfDay)
;

ALTER TABLE Depart_profess ADD CONSTRAINT PK_Depart_profess 
	PRIMARY KEY CLUSTERED (ID_dep_pro)
;

ALTER TABLE Departments ADD CONSTRAINT PK_Departments 
	PRIMARY KEY CLUSTERED (ID_Department)
;

ALTER TABLE General ADD CONSTRAINT PK_General 
	PRIMARY KEY CLUSTERED (ID)
;

ALTER TABLE Groups ADD CONSTRAINT PK_Groups 
	PRIMARY KEY CLUSTERED (ID_Group)
;

ALTER TABLE People ADD CONSTRAINT PK_People 
	PRIMARY KEY CLUSTERED (ID_Human)
;

ALTER TABLE Positions ADD CONSTRAINT PK_Positions 
	PRIMARY KEY CLUSTERED (ID_Position)
;

ALTER TABLE Ranks ADD CONSTRAINT PK_Ranks 
	PRIMARY KEY CLUSTERED (ID_Rank)
;

ALTER TABLE Subjects ADD CONSTRAINT PK_Subjects 
	PRIMARY KEY CLUSTERED (ID_Subject)
;

ALTER TABLE Week ADD CONSTRAINT PK_Week 
	PRIMARY KEY CLUSTERED (ID_Day)
;



ALTER TABLE Depart_profess ADD CONSTRAINT FK_Depart_profess_Departments 
	FOREIGN KEY (Departament) REFERENCES Departments (ID_Department)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Depart_profess ADD CONSTRAINT FK_Depart_profess_People 
	FOREIGN KEY (Professor) REFERENCES People (ID_Human)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE Depart_profess ADD CONSTRAINT FK_Depart_profess_Positions 
	FOREIGN KEY (Position) REFERENCES Positions (ID_Position)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE General ADD CONSTRAINT FK_General_Groups 
	FOREIGN KEY (Group) REFERENCES Groups (ID_Group)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE General ADD CONSTRAINT FK_General_People 
	FOREIGN KEY (Professor) REFERENCES People (ID_Human)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE General ADD CONSTRAINT FK_General_Subjects 
	FOREIGN KEY (Subject) REFERENCES Subjects (ID_Subject)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE General ADD CONSTRAINT FK_General_Week 
	FOREIGN KEY (Day) REFERENCES Week (ID_Day)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE People ADD CONSTRAINT FK_People_Departments 
	FOREIGN KEY (Departament) REFERENCES Departments (ID_Department)
	ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE People ADD CONSTRAINT FK_People_Ranks 
	FOREIGN KEY (Rank) REFERENCES Ranks (ID_Rank)
	ON DELETE CASCADE ON UPDATE CASCADE
;