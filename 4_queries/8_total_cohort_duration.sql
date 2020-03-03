SELECT cohorts.name as name, sum(completed_at-started_at) as total_duration
FROM assistance_requests
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.id
ORDER BY sum(completed_at-started_at)