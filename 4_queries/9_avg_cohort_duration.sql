SELECT sum(total_duration)/count(*) as average_total_duration
FROM(
SELECT sum(completed_at-started_at) as total_duration
  FROM assistance_requests
    JOIN students ON assistance_requests.student_id = students.id
    JOIN cohorts ON cohorts.id = students.cohort_id
  GROUP BY cohorts.id) x
