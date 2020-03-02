SELECT cohorts.name as cohort_name, count(students.name) AS student_count
FROM cohorts JOIN students ON cohorts.id=students.cohort_id
GROUP BY cohorts.name
HAVING count(students.name)>=18
ORDER BY count(students.name);