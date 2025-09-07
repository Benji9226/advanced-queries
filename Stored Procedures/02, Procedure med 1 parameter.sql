create or replace procedure list_students_by_program(p_program_id int)
language plpgsql
as $$
declare
    r record;
begin
    raise notice 'Student Name';
    
    for r in
        select s.name
        from "Students" s
        where s.programid = p_program_id
    loop
        raise notice '%', r.name;
    end loop;
end;
$$;

call list_students_by_program(2);

