CREATE DATABASE University
USE University

CREATE TABLE Groups(
	Id int primary key identity,
	GroupNo tinyint
)

ALTER TABLE Groups
ADD GroupNo nvarchar(6)


CREATE TABLE Students(
	Id int primary key identity,
	[Name] nvarchar(30) NOT NULL CHECK(len([Name]) >= 3),
	Surname nvarchar(30) NOT NULL CHECK(len(Surname) >= 3),
	Point int CHECK(Point > 0 AND Point < 100),
	GroupId int FOREIGN KEY REFERENCES Groups(Id)
)

ALTER TABLE Students
ADD Point int CHECK(Point >= 0 AND Point <= 100)

CREATE TABLE Exams(
	Id int primary key identity,
	SubjectName nvarchar(30) NOT NULL
)

ALTER TABLE Exams
ADD COLUMN StartDate tinyint,
COLUMN EndDate tinyint

CREATE TABLE StudentExams(
	Id int primary key identity,
	SubjectName nvarchar(30) NOT NULL,
	StudentId int FOREIGN KEY REFERENCES Students(Id),
	ExamId int FOREIGN KEY REFERENCES Exams(Id),
	ResultPoint int CHECK(ResultPoint >= 0 AND ResultPoint <= 100)
)

--Query-1
SELECT * FROM Students AS s
JOIN Groups AS g
ON g.GroupNo = s.Id

--Query-2
SELECT * FROM Students AS st