/*
create or replace view active_students as
select s.id, s.name, s.programId
from "Students" s
where exists (
    select 1
    from "Exams" e
    where e.studentId = s.id
      and e.grade >= 2
);
*/

update active_students
set name = 'Benjamin T.'
where id = 4;

