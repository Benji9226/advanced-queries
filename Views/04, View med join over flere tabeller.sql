create or replace view course_enrollments as
select 
    c.name as course_name,
    p.name as program_name,
    count(e.studentId) as student_count
from "Courses" c
join "Programs" p 
    on c.programId = p.id
left join "Enrollments" e 
    on c.id = e.courseId
group by c.name, p.name;