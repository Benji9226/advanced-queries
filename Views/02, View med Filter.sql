create or replace view failed_exams as
select
  s.name as student_name,
  e.grade
from
  "Exams" e
join
  "Students" s
on
  e.studentId = s.id
where
  e.grade < 2;
