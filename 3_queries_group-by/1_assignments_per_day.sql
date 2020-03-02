SELECT day, count(duration)
FROM assignments
GROUP BY day
ORDER BY day;