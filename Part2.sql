/*Second script (txt or SQL file): SQL statements for inserting, updating, and deleting (if any) data.*/

USE [master]
GO

USE [Group5]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME IN ('ASSESSMENT','ASSESSMENT_RESULT','ATTENDANCE','COURSE','DEPARTMENT',
'ENROLLMENT','GRADE','INSTRUCTOR','STUDENT') AND TABLE_CATALOG = 'Group5')
BEGIN
DELETE FROM ASSESSMENT
PRINT 'Table dropped.'
DELETE FROM ASSESSMENT_RESULT
PRINT 'Table dropped.'
DELETE FROM ATTENDANCE
PRINT 'Table dropped.'
DELETE FROM GRADE
PRINT 'Table dropped.'
DELETE FROM ENROLLMENT
PRINT 'Table dropped.'
DELETE FROM COURSE
PRINT 'Table dropped.'
DELETE FROM INSTRUCTOR
PRINT 'Table dropped.'
DELETE FROM DEPARTMENT
PRINT 'Table dropped.'
DELETE FROM STUDENT
PRINT 'Table dropped.'
END

ALTER TABLE COURSE
ALTER COLUMN course_name varchar(50);

ALTER TABLE ASSESSMENT_RESULT
ALTER COLUMN score decimal(4,2);


SET IDENTITY_INSERT [STUDENT] ON 
INSERT [STUDENT] ([student_id], [name], [date_of_birth], [contact_info]) VALUES (1,'John W','09/02/1995','john@gmail.com')
INSERT [STUDENT] ([student_id], [name], [date_of_birth], [contact_info]) VALUES (3,'Abby Yen','03/26/2000','ayen@gmail.com')
INSERT [STUDENT] ([student_id], [name], [date_of_birth], [contact_info]) VALUES (2,'Karen Watt','06/20/1991','karen@outlook.com')
INSERT [STUDENT] ([student_id], [name], [date_of_birth], [contact_info]) VALUES (4,'Hailey M','12/10/1999','mhailey@aol.com')
INSERT [STUDENT] ([student_id], [name], [date_of_birth], [contact_info]) VALUES (5,'JD Johns','10/13/2003','jdjohns@gmail.com')
SET IDENTITY_INSERT [STUDENT] OFF 

SET IDENTITY_INSERT [DEPARTMENT] ON 
INSERT [DEPARTMENT] ([department_id], [department_name]) VALUES (11,'Technology')
INSERT [DEPARTMENT] ([department_id], [department_name]) VALUES (12,'Medical')
INSERT [DEPARTMENT] ([department_id], [department_name]) VALUES (13,'Mathematics')
SET IDENTITY_INSERT [DEPARTMENT] OFF 

SET IDENTITY_INSERT [INSTRUCTOR] ON 
INSERT [INSTRUCTOR] ([instructor_id], [name], [contact_info], [department_id]) VALUES (101,'Schmidt Y','schmidt@gmail.com',11)
INSERT [INSTRUCTOR] ([instructor_id], [name], [contact_info], [department_id]) VALUES (102,'R Ali','alir@gmail.com',12)
INSERT [INSTRUCTOR] ([instructor_id], [name], [contact_info], [department_id]) VALUES (103,'Polly Dey','pdey11@outlook.com',13)
INSERT [INSTRUCTOR] ([instructor_id], [name], [contact_info], [department_id]) VALUES (104,'Emma J','emma104@aol.com',12)
SET IDENTITY_INSERT [INSTRUCTOR] OFF 

SET IDENTITY_INSERT [COURSE] ON 
INSERT [COURSE] ([course_id], [course_name], [credits], [instructor_id], [department_id]) VALUES (301,'Print Media',3,101,11)
INSERT [COURSE] ([course_id], [course_name], [credits], [instructor_id], [department_id]) VALUES (302,'Medical Terminology',3,102,12)
INSERT [COURSE] ([course_id], [course_name], [credits], [instructor_id], [department_id]) VALUES (303,'Robotics',6,101,11)
INSERT [COURSE] ([course_id], [course_name], [credits], [instructor_id], [department_id]) VALUES (304,'Statistics',1,103,13)
INSERT [COURSE] ([course_id], [course_name], [credits], [instructor_id], [department_id]) VALUES (305,'Epidemiology',1,104,12)
SET IDENTITY_INSERT [COURSE] OFF

SET IDENTITY_INSERT [ENROLLMENT] ON 
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1001,1,304,'08/15/2024')
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1002,2,302,'08/14/2024')
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1003,3,305,'08/14/2024')
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1004,4,303,'08/10/2024')
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1005,5,303,'07/20/2024')
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1006,5,304,'07/21/2024')
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1007,4,301,'08/10/2024')
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1008,1,301,'08/15/2024')
INSERT [ENROLLMENT] ([enrollment_id], [student_id], [course_id], [enrollment_date]) VALUES (1009,4,304,'08/15/2024')
SET IDENTITY_INSERT [ENROLLMENT] OFF 


SET IDENTITY_INSERT [GRADE] ON 
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (111,'A',1001)
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (112,'A',1008)
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (113,'B',1002)
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (114,'D',1003)
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (115,'B',1004)
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (116,'C',1005)
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (117,'B',1007)
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (118,'B',1009)
INSERT [GRADE] ([grade_id], [grade_value], [enrollment_id]) VALUES (119,'C',1006)
SET IDENTITY_INSERT [GRADE] OFF 

SET IDENTITY_INSERT [ATTENDANCE] ON 
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2001,1001,'09/16/2024', 'Present')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2002,1003,'09/19/2024', 'Absent')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2003,1002,'09/21/2024', 'Present')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2004,1006,'09/16/2024', 'Present')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2005,1004,'09/15/2024', 'Absent')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2006,1005,'09/15/2024', 'Absent')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2007,1007,'09/20/2024', 'Present')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2008,1008,'09/20/2024', 'Present')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2009,1009,'09/16/2024', 'Absent')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2010,1007,'09/16/2024', 'Absent')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2011,1007,'09/18/2024', 'Absent')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2012,1009,'09/18/2024', 'Absent')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2013,1001,'09/16/2024', 'Present')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2014,1008,'09/21/2024', 'Present')
INSERT [ATTENDANCE] ([attendance_id], [enrollment_id], [date], [attendance_status]) VALUES (2015,1003,'09/21/2024', 'Present')
SET IDENTITY_INSERT [ATTENDANCE] OFF 


SET IDENTITY_INSERT [ASSESSMENT] ON 
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2011,301,'Mid Term','10/24/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2012,302,'Final Term','11/20/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2013,303,'Mid Term','10/23/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2014,304,'Final Term','11/21/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2015,305,'Mid Term','10/22/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2016,301,'Final Term','11/22/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2017,302,'Mid Term','10/20/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2018,303,'Final Term','11/22/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2019,304,'Mid Term','10/21/2024')
INSERT [ASSESSMENT] ([assessment_id], [course_id], [assessment_type], [date]) VALUES (2020,305,'Mid Term','09/26/2024')
SET IDENTITY_INSERT [ASSESSMENT] OFF

SET IDENTITY_INSERT [ASSESSMENT_RESULT] ON 
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3011,2011,4,86.23)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3012,2011,1,91.65)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3013,2012,2,97.42)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3014,2013,4,65.75)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3015,2013,5,87.56)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3016,2014,1,79.12)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3017,2014,4,98.23)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3018,2014,5,95.97)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3019,2015,3,89.23)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3020,2016,4,93.65)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3021,2016,1,84.43)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3022,2017,2,81.45)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3023,2018,4,80.65)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3024,2018,5,91.78)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3025,2019,1,76.46)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3026,2019,4,87.57)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3027,2019,5,84.34)
INSERT [ASSESSMENT_RESULT] ([result_id], [assessment_id], [student_id], [score]) VALUES (3028,2020,3,87.56)
SET IDENTITY_INSERT [ASSESSMENT_RESULT] OFF