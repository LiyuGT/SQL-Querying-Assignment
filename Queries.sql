USE university;
-- 1. Print out all the student first names and last names. 
-- Option 1
select first_name, last_name 
from student;
-- Option 2
select concat(first_name," ", last_name) AS name
from student;

-- 2. Print out the IDs of all the tenured instructors. 
select instructor_id AS ID
from instructor
where tenured = '1';

-- 3. Print out the student first and last names along with their advisor's first and last names. 
-- Make sure to alias descriptive column names. Leave out any students without advisors and any 
-- advisors without students. 
select concat(s.first_name," ", s.last_name) AS Student_Name, concat(i.first_name," ", i.last_name) AS Advisor_Name
from student s INNER join instructor i ON s.advisor_id = i.instructor_id;

-- 4.Print out the ID, first name, and last name of all instructors who do not have any advisees 
-- (HINT: Lookup the different join types in MySQL and use "IS NULL" instead of "= NULL").
select i.instructor_id AS Instructor_ID, concat(i.first_name," ", i.last_name) AS Instructor_Name
from instructor i LEFT JOIN student s ON s.advisor_id = i.instructor_id
WHERE s.first_name is NULL;

-- 5. Print out the first and last name of all the instructors along with the total number of credit hours they teach.
select concat(i.first_name," ", i.last_name) AS Instructor_Name, SUM(c.num_credits) AS Total_CreditHours
from instructor i JOIN course c ON c. instructor_id = i.instructor_id
Group by Instructor_Name;

-- 6. Print out the course code and course name of all 3000 level courses (HINT: Lookup the SQL LIKE operator). 
Select course_code AS Code, course_name AS Course
from course
where course_code LIKE '%_3___%';

-- 7. Print out the course schedule of the student with an ID of 1 by printing off the course code, 
-- instructor first name, instructor last name, and number of credit hours for each course in which student 1 is enrolled. 
-- option 1
Select s.student_id, concat(s.first_name," ", s.last_name) AS Student_Name, c.course_code as Course_code, 
concat(i.first_name," ", i.last_name) AS Instructor_Name, c.num_credits as Credit_Hours
from student s join instructor i ON s.advisor_id = i.instructor_id 
JOIN course c ON c. instructor_id = i.instructor_id
where student_id = 1;
-- option 2
Select c.course_code as Course_code, 
concat(i.first_name," ", i.last_name) AS Instructor_Name, c.num_credits as Credit_Hours
from student s join instructor i ON s.advisor_id = i.instructor_id 
JOIN course c ON c. instructor_id = i.instructor_id
where student_id = 1;





