const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx"
});

let args = process.argv.slice(2);

let cohortName = args[0];

pool
  .query(
    `
    SELECT distinct teachers.name as name, cohorts.name as cohort
    FROM assistance_requests
      JOIN teachers ON teachers.id = assistance_requests.teacher_id
      JOIN students ON students.id = assistance_requests.student_id
      JOIN cohorts ON cohorts.id = students.cohort_id
    WHERE cohorts.name = '${cohortName}'
    ORDER BY teachers.name
`
  )
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.name}`);
    });
  })
  .catch(err => console.error("query error", err.stack));
