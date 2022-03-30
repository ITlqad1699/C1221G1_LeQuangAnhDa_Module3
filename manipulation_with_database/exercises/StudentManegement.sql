DROP DATABASE IF EXISTS student_manegement;
CREATE DATABASE student_manegement;
USE student_manegement;
CREATE TABLE Class
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', CURRENT_DATE, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
       
       #Hiển thị danh sách tất cả học viên
SELECT *
FROM STUDeNt;

#Hiển thị danh sách học viên đang theo học
SELECT *
FROM Student
WHERE StAtUS = true;

#HIỂN thị danh sÁCH các môn học có thời gian học nhỏ hơn 10 giờ.
SELECT *
FROM Subject
WHERE Credit < 10;

#HIỂN tHị DANh sách họC VIÊn lớp A1
SELECT S.StudentId, S.StudentName, C.ClassName
FROM STUDENt S join ClaSs C on S.ClassId = C.ClassID
WHERE C.ClassNAME = 'A1';

#HiểN thị điểM mÔn CF của CÁC họC viên.
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM StudenT S JOin Mark M on S.StudentId = M.StuDentId jOin SubjeCT Sub on M.SubID = Sub.SubID
WHERE Sub.SuBNaMe = 'CF';

#HIển thị tên siNH vIên bắt đầu Bằng h 
SELECT*FROM STUDENT 
WHERE StudentName LIKE 'h%';

#hiển thị danh sách lớp học BẮT ĐẦU THÁng 12
SELECT*FROM class WHERE STartDate between '2008-12-01' and  '2008-12-30';

#hiển thị thông tin TRONG LỚP học có CREDIt từ 3-5:
SELECT*FROM Subject WHERE Credit between 3 and 5;

#thay đổi ID của học viên tên Hung
-- Set sql_safe_updaTES = 0;
-- UPDATE STUDENt SET ClASSID = 2 WHERE StudentName = 'Hung' ;
-- Set sql_safe_updates = 1;

#Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT  StudentName, SubName, Mark 
FROm Student 
join Mark on Student.StudentId = Mark.StudentId
Join Subject on Mark.SubId  = Subject.SubId 
OrDER BY Mark.Mark DESC,
		StuDent.StuDENTName ASC;
			

