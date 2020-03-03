SELECT count(*)
FROM assistance_requests x JOIN teachers y ON x.teacher_id = y.id
WHERE y.name ='Waylon Boehm'