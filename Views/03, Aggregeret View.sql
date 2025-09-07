create or replace view program_avg_grades as
select 
    p.name as program_name,
    avg(e.grade) as average_grade
from "Exams" e
join "Programs" p 
    on e.programId = p.id
group by p.name;