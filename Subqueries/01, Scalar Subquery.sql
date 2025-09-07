SELECT 
  s.id,
  s.name,
  s.programId,
  (
    SELECT AVG(grade) 
    FROM "Exams"
  ) AS gennemsnit_eksamenskarakter
FROM "Students" s;
