SELECT 
    name,
    (
        SELECT MAX(e.grade)
        FROM "Exams" e
        WHERE studentId = "Students".id
    ) AS best_grade
FROM "Students";
