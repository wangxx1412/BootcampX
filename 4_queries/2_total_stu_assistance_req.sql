SELECT count(*), y.name
FROM assistance_requests x JOIN students y ON x.student_id = y.id
WHERE y.name = 'Elliot Dickinson'
GROUP BY y.name;