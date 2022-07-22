const mysql = require("mysql");

const pool = mysql.createPool({
  password: "",
  user: "root",
  database: "sqlexam",
  host: "localhost",
  port: "3306",
});

pool.getConnection((err, connection) => {
  if (err) throw err;
  console.log(`Connection Established!`);
});

module.exports = pool;
