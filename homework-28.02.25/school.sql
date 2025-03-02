CREATE TABLE IF NOT EXISTS Teachers (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(255),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

CREATE TABLE IF NOT EXISTS Grades (
    grade_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(255),
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Teachers
VALUES
(1, 'Nelli', 'Amroyan'),
(2, 'Sona', 'Avagyan');

INSERT INTO Classes
VALUES
(1, 'History', 1),
(2, 'Mathematics', 2);

INSERT INTO Students
VALUES
(1, 'Elen', 'Poghosyan', 1),
(2, 'Anna', 'Grigoryan', 2),
(3, 'Nare', 'Avetisyan', 1);

INSERT INTO Grades
VALUES
(1, 1, 'History', 'A'),
(2, 2, 'Mathematics', 'B'),
(3, 3, 'History', 'C');

SELECT Students.first_name, Classes.class_name
FROM Students
JOIN Classes ON Students.class_id = Classes.class_id;

SELECT Teachers.first_name, Teachers.last_name, Classes.class_name
FROM Teachers
JOIN Classes ON Teachers.teacher_id = Classes.teacher_id;

SELECT Students.first_name, Grades.subject, Grades.grade
FROM Students
JOIN Grades ON Students.student_id = Grades.student_id;

SELECT Classes.class_name, COUNT(Students.student_id) AS student_count
FROM Classes
LEFT JOIN Students ON Classes.class_id = Students.class_id
GROUP BY Classes.class_name;

SELECT Students.first_name, Students.last_name
FROM Students
JOIN Classes ON Students.class_id = Classes.class_id
WHERE Classes.class_name = 'Mathematics';

SELECT * FROM Students;
SELECT * FROM Classes;
SELECT * FROM Teachers;
SELECT * FROM Grades;