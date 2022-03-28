DROP DATABASE IF EXISTS student_manegement;
CREATE DATABASE student_manegement;
USE student_manegement;
CREATE TABLE type_of_class (
    id INT PRIMARY KEY,
    `name` VARCHAR(50)
);
 
 CREATE TABLE account_james (
    `account` VARCHAR(50),
    `password` VARCHAR(20),
    PRIMARY KEY (`account`)
);

CREATE TABLE instructor (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE class (
    id INT,
    `name` CHAR(7),
    type_of_class_id INT,
    CONSTRAINT pk_class PRIMARY KEY (id),
    CONSTRAINT fk_class_type_of_class FOREIGN KEY (type_of_class_id)
        REFERENCES type_of_class (id)
);
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    date_of_birth DATE,
    account_james VARCHAR(50),
    class_id INT,
    FOREIGN KEY (account_james)
        REFERENCES account_james (`account`),
    FOREIGN KEY (class_id)
        REFERENCES class (id)
);
/* 1: Full time, 2: Half time */

CREATE TABLE instructor_teach_class (
    instructor_id INT,
    class_id INT,
    PRIMARY KEY (instructor_id , class_id),
    FOREIGN KEY (instructor_id)
        REFERENCES instructor (id),
    FOREIGN KEY (class_id)
        REFERENCES class (id)
);

INSERT INTO type_of_class
VALUES
(1, 'Full time'),
(2, 'Half time');

INSERT INTO class
VALUES
(1, 'C1221G1', 1),
(2, 'C1221G1', 1),
(3, 'C1221H1', 2);

INSERT INTO account_james
VALUES
('le quang anh da', '12345678'),
('nguyen van thong', '12345678'),
('ly the vinh', '12345678'),
('dang huyen', '12345678');

INSERT INTO student
VALUES
(1, 'da', '2000-07-14', 'le quang anh da', 1),
(2, 'thong', '2002-05-03', 'nguyen van thong', 2),
(3, 'vinh', '2001-04-03', 'ly the vinh', 2),
(4, 'huyen', '2002-01-25', 'dang huyen', NULL);

INSERT INTO instructor
VALUES
(1, 'Tien', '2000-07-14'),
(2, 'Trung', '2002-05-03'),
(3, 'Hai', '2003-11-03'),
(4, 'Chanh', '1998-07-09');

INSERT INTO instructor_teach_class
VALUES
(1, 1),
(1, 2),
(2, 1);

