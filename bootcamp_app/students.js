const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx"
});

let args = process.argv.slice(2, 4);

let cohort_mon = args[0];
let limit = args[1];

pool
  .query(
    `
SELECT x.id, x.name, x.cohort_id,y.name as cohort_name
FROM students x JOIN cohorts y ON x.cohort_id = y.id
WHERE y.name LIKE '%${cohort_mon}%'
LIMIT ${limit};
`
  )
  .then(res => {
    res.rows.forEach(user => {
      console.log(
        `${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`
      );
    });
  })
  .catch(err => console.error("query error", err.stack));
