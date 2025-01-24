/*First script (txt or SQL file)- SQL statements 
for creating tables, constraints, indexes, and other database objects as defined in the Table Design in your Complete Project Proposal.*/

USE [master]
GO


/****** Drop database if it exists ******/
IF DB_ID('Group5') IS NOT NULL
	DROP DATABASE [Group5]
GO


/****** Create a new database and use it ******/
CREATE DATABASE [Group5]
GO

USE [Group5]
GO

CREATE TABLE STUDENT
(
	[student_id] [int] IDENTITY(1,1) UNIQUE CHECK (student_id > 0),
	[name] [varchar](10) NOT NULL,
	[date_of_birth] [date] NULL,
    [contact_info] [varchar] (30) NULL
    CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED ([student_id] ASC)
) 
GO

CREATE TABLE DEPARTMENT
(
	[department_id] [int] IDENTITY(1,1) UNIQUE CHECK (department_id > 0),
	[department_name] [varchar](15) NOT NULL,
    CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED ([department_id] ASC)
)
GO


CREATE TABLE INSTRUCTOR
(
	[instructor_id] [int] IDENTITY(1,1) UNIQUE CHECK (instructor_id > 0),
	[name] [varchar](10) NOT NULL,
	[contact_info] [varchar] (30) NULL,
    [department_id ] [int] NOT NULL CHECK (department_id > 0),
    CONSTRAINT [PK_INTRUCTOR] PRIMARY KEY CLUSTERED ([instructor_id] ASC),
	CONSTRAINT department_id_fk_in FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
) 
GO

CREATE TABLE COURSE
(
	[course_id] [int] IDENTITY(1,1) UNIQUE CHECK (course_id > 0),
	[course_name] [varchar](15) NOT NULL,
	[credits] [int] NOT NULL CHECK (credits > 0),
    [instructor_id ] [int] NOT NULL CHECK (instructor_id > 0),
	[department_id] [int] NOT NULL CHECK (department_id > 0),
    CONSTRAINT [PK_COURSE] PRIMARY KEY CLUSTERED ([course_id] ASC),
	CONSTRAINT instructor_id_fk FOREIGN KEY (instructor_id) REFERENCES INSTRUCTOR(instructor_id),
	CONSTRAINT department_id_fk_cs FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
) 
GO

CREATE TABLE ENROLLMENT
(
	[enrollment_id] [int] IDENTITY(1,1) UNIQUE CHECK (enrollment_id > 0),
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
    [enrollment_date] [date] NOT NULL,
    CONSTRAINT [PK_ENROLLMENT] PRIMARY KEY CLUSTERED ([enrollment_id] ASC),
	CONSTRAINT student_id_fk FOREIGN KEY (student_id) REFERENCES STUDENT(student_id),
	CONSTRAINT course_id_fk FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
) 
GO

CREATE TABLE GRADE
(
	[grade_id] [int] IDENTITY(1,1) UNIQUE CHECK (grade_id > 0),
	[enrollment_id] [int] NOT NULL CHECK (enrollment_id > 0),
	[grade_value] [varchar] NOT NULL,
    CONSTRAINT [PK_GRADE] PRIMARY KEY CLUSTERED ([grade_id] ASC),
    CONSTRAINT enrollment_id_fk_gr FOREIGN KEY (enrollment_id) REFERENCES ENROLLMENT(enrollment_id)
) 
GO

CREATE TABLE ATTENDANCE
(
	[attendance_id] [int] IDENTITY(1,1) UNIQUE CHECK (attendance_id > 0),
	[enrollment_id] [int] NOT NULL CHECK (enrollment_id > 0),
	[date] [date] NOT NULL,
    [attendance_status] [varchar](10) NOT NULL,
    CONSTRAINT [PK_ATTENDANCE] PRIMARY KEY CLUSTERED ([attendance_id] ASC),
	CONSTRAINT enrollment_id_fk FOREIGN KEY (enrollment_id) REFERENCES ENROLLMENT(enrollment_id)
) 
GO

CREATE TABLE ASSESSMENT
(
	[assessment_id] [int] IDENTITY(1,1) UNIQUE CHECK (assessment_id > 0),
	[course_id] [int] NOT NULL CHECK (course_id > 0),
	[assessment_type] [varchar](15) NOT NULL,
    [date] [date] NOT NULL,
    CONSTRAINT [PK_ASSESSMENT] PRIMARY KEY CLUSTERED ([assessment_id] ASC),
	CONSTRAINT course_id_fk_as FOREIGN KEY (course_id) REFERENCES COURSE(course_id)
) 
GO

CREATE TABLE ASSESSMENT_RESULT
(
	[result_id] [int] IDENTITY(1,1) UNIQUE CHECK (result_id > 0),
	[assessment_id] [int] NOT NULL CHECK (assessment_id > 0),
	[student_id] [int] NOT NULL CHECK (student_id > 0),
    [score] [decimal](2,2) NULL,
    CONSTRAINT [PK_ASSESSMENT_RESULT] PRIMARY KEY CLUSTERED ([result_id] ASC, [assessment_id] ASC, [student_id] ASC)
) 
GO