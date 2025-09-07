create or replace procedure list_all_students()
language plpgsql
as $$
declare
    r record;
begin
    raise notice 'Student Name | Program Name';
    
    for r in
        select s.name as student_name, p.name as program_name
        from "Students" s
        join "Programs" p on s.programid = p.id
    loop
        raise notice '% | %', r.student_name, r.program_name;
    end loop;
end;
$$;


call list_all_students();
