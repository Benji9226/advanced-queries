create or replace view student_overview as
select
  s.name as student_name,
  p.name as program_name,
  p.level as program_level
from
  "Students" s
join
  "Programs" p
on
  s.programId = p.id;
