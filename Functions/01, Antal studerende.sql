create or replace function get_student_count()
returns integer
language plpgsql
as $$
declare
    total integer;
begin
    select count(*) into total
    from "Students";
    return total;
end;
$$;


select get_student_count();
