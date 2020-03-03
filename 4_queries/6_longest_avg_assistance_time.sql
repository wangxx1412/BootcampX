SELECT cohorts.name as name, avg(completed_at-started_at) as average_assistance_time
FROM assistance_requests
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.id
ORDER BY avg(completed_at-started_at) DESC
LIMIT 1;