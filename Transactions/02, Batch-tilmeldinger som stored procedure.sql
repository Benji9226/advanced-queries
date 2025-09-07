create or replace procedure enroll_many_on_course(
    p_course_id int,
    p_student_ids int[]
)
language plpgsql
as $$
declare
    sid int;
begin
    foreach sid in array p_student_ids loop
        insert into "Enrollments"(studentid, courseid)
        values (sid, p_course_id);
    end loop;

    raise notice 'All students enrolled successfully. Total enrolled: %', array_length(p_student_ids,1);

exception
    when unique_violation then
        raise notice 'Transaction failed: duplicate entry or invalid student_id. All inserts rolled back.';
    when foreign_key_violation then
        raise notice 'Transaction failed: student_id or course_id does not exist. All inserts rolled back.';
end;
$$;

call enroll_many_on_course(1, array[1,2,3]);