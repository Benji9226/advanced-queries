create or replace procedure add_new_student(p_name varchar, p_program_id int)
language plpgsql
as $$
begin
    insert into "Students"(name, programid)
    values (p_name, p_program_id);
    
    raise notice 'Student "%" added to program id %', p_name, p_program_id;
end;
$$;


call add_new_student('Benjamin Telsing', 3);