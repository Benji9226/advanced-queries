SELECT 
  s.id,
  s.name,
  s.programId
FROM "Students" s
WHERE (s.id, s.programId) = (
  SELECT e.studentId, e.programId
  FROM "Exams" e
  WHERE e.grade = (
    SELECT MAX(grade) FROM "Exams"
  )
);
