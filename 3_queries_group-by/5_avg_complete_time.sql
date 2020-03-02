SELECT students.name, avg(assignment_submissions.duration) as average_complete_time
FROM students JOIN assignment_submissions ON students.id = assignment_submissions.student_id
WHERE students.end_date is NULL
GROUP BY students.id
ORDER BY average_complete_time DESC;