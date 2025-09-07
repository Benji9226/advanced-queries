SELECT name
FROM "Students"
WHERE id IN (
    SELECT studentId
    FROM "Enrollments"
    WHERE courseId IN (
        SELECT id
        FROM "Courses"
        WHERE programId IN (
            SELECT id
            FROM "Programs"
            WHERE name = 'Multimediedesigner'
        )
    )
);
