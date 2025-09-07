create or replace function get_avg_grade(p_programId int)
returns numeric
language plpgsql
as $$
declare
    avg_grade numeric;
begin
    select avg(e.grade)::numeric
    into avg_grade
    from "Exams" e
    where e.programid = p_programId;

    return avg_grade;
end;
$$;

select get_avg_grade(2);