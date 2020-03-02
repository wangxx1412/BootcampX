SELECT students.name, avg(assignment_submissions.duration) as average_complete_time, avg(assignments.duration) as average_estimated_duration
FROM assignment_submissions JOIN students ON student_id = students.id
  JOIN assignments ON assignment_id=assignments.id
WHERE students.end_date is NULL
GROUP BY students.id
HAVING avg(assignment_submissions.duration)<avg(assignments.duration)
ORDER BY average_complete_time;