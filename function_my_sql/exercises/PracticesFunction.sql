use student_manegement;
#Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT*FROM subject s 
group by s.SubId, s.SubName 
having Credit >= all (SELECT Credit FROM subject GROUP BY s.SubId);
#Hiển thị các thông tin môn học có điểm thi lớn nhất.
select*from subject s join mark m on s.SubId = m.SubId 
group by s.SubId, s.SubName 
having m.mark >= all(select mark from mark group by m.SubId);
#Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select*, avg(mark) from student s join mark m on s.StudentId = m.StudentId
group by  s.StudentId, s.StudentName
order by avg(mark) DESC;