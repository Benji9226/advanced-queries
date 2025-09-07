create or replace function get_students_on_course(p_course_id int)
returns table(student_name varchar)
language plpgsql
as $$
begin
    return query
    select s.name
    from "Enrollments" e
    join "Students" s on e.studentid = s.id
    where e.courseid = p_course_id;
end;
$$;


select * from get_students_on_course(1);