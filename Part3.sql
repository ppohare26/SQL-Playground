use [Group5];

/*QUE1*/
SELECT C.course_id, C.course_name, C.credits 
FROM COURSE C
JOIN DEPARTMENT D ON C.department_id = D.department_id
WHERE D.department_name = 'Medical'; 

/*QUE2*/
SELECT S.name AS student_name, C.course_name, E.enrollment_date 
FROM ENROLLMENT E
JOIN STUDENT S ON E.student_id = S.student_id
JOIN COURSE C ON E.course_id = C.course_id
WHERE C.course_name = 'Statistics'; 

/*QUE3*/
SELECT S.name AS student_name, A.assessment_type, C.course_name, A.date 
FROM ASSESSMENT_RESULT AR
JOIN ASSESSMENT A ON AR.assessment_id = A.assessment_id
JOIN COURSE C ON A.course_id = C.course_id
JOIN STUDENT S ON AR.student_id = S.student_id
WHERE S.name = 'John W';

/*QUE4*/
SELECT 
    s.name AS student_name,
    c.course_name,
    COUNT(a.attendance_id) AS absence_count
FROM ATTENDANCE a
JOIN ENROLLMENT e ON a.enrollment_id = e.enrollment_id
JOIN STUDENT s ON e.student_id = s.student_id
JOIN COURSE c ON e.course_id = c.course_id
WHERE a.attendance_status = 'Absent'
  AND c.course_id = 304
GROUP BY s.name, c.course_name
ORDER BY absence_count DESC;

/*QUE5*/
SELECT TOP 1
    grade_value AS Grade,
    COUNT(grade_value) AS Average
FROM GRADE
GROUP BY grade_value
ORDER BY Average DESC;

/*QUE6*/
SELECT S.name AS 'Student Name'
FROM ATTENDANCE A
JOIN ENROLLMENT E ON A.enrollment_id = E.enrollment_id
JOIN STUDENT S ON E.student_id = S.student_id
GROUP BY S.name
HAVING COUNT(CASE WHEN A.attendance_status = 'Absent' THEN 1 END) = 0;

/*QUE7*/
WITH RankedScores AS (
    SELECT A.assessment_id, AR.score, S.name, 
           RANK() OVER (PARTITION BY A.assessment_id ORDER BY AR.score DESC) AS rank
    FROM ASSESSMENT_RESULT AR
    JOIN ASSESSMENT A ON AR.assessment_id = A.assessment_id
    JOIN STUDENT S ON AR.student_id = S.student_id
)
SELECT assessment_id, score, name 
FROM RankedScores
WHERE rank <= 3;

/*QUE8*/
SELECT D.department_name, COUNT(DISTINCT E.student_id) AS total_students
FROM ENROLLMENT E
JOIN COURSE C ON E.course_id = C.course_id
JOIN DEPARTMENT D ON C.department_id = D.department_id
GROUP BY D.department_name;

/*QUE9*/
SELECT COUNT(DISTINCT E.student_id) AS 'Students taking more than 3'
FROM ENROLLMENT E
GROUP BY E.student_id
HAVING COUNT(E.course_id) > 3;

/*QUE10*/
SELECT I.name AS instructor_name, COUNT(A.assessment_id) AS total_assessments
FROM ASSESSMENT A
JOIN COURSE C ON A.course_id = C.course_id
JOIN INSTRUCTOR I ON C.instructor_id = I.instructor_id
GROUP BY I.name;

/*QUE11*/
SELECT I.name AS instructor_name, D.department_name, COUNT(C.course_id) AS total_courses
FROM COURSE C
JOIN INSTRUCTOR I ON C.instructor_id = I.instructor_id
JOIN DEPARTMENT D ON C.department_id = D.department_id
GROUP BY I.name, D.department_name;

/*QUE12*/
SELECT C.course_name, COUNT(A.attendance_status) AS total_absences
FROM ATTENDANCE A
JOIN ENROLLMENT E ON A.enrollment_id = E.enrollment_id
JOIN COURSE C ON E.course_id = C.course_id
WHERE A.attendance_status = 'Absent'
GROUP BY C.course_name
ORDER BY total_absences DESC;

/*QUE13*/
SELECT COUNT(DISTINCT S.student_id) AS students_with_A_perfect_attendance
FROM GRADE G
JOIN ENROLLMENT E ON G.enrollment_id = E.enrollment_id
JOIN STUDENT S ON E.student_id = S.student_id
JOIN ATTENDANCE A ON E.enrollment_id = A.enrollment_id
WHERE G.grade_value = 'A'
GROUP BY S.student_id
HAVING COUNT(CASE WHEN A.attendance_status = 'Absent' THEN 1 END) = 0;

/*QUE14*/
SELECT D.department_name, COUNT(C.course_id) AS total_courses
FROM DEPARTMENT D
JOIN COURSE C ON D.department_id = C.department_id
GROUP BY D.department_name;

/*QUE15*/
SELECT C.course_name
FROM COURSE C
JOIN INSTRUCTOR I ON C.instructor_id = I.instructor_id
WHERE I.name = 'Schmidt Y';
