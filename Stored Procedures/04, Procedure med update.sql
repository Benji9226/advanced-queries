create or replace procedure update_student_program(p_student_id int, p_new_program_id int)
language plpgsql
as $$
begin
    update "Students"
    set programid = p_new_program_id
    where id = p_student_id;
    
    raise notice 'Student with id % has been moved to program id %', p_student_id, p_new_program_id;
end;
$$;

call update_student_program(4, 3);