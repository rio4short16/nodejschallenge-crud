const pool = require("../db");

// Fetching one student record from our table
const fetchOneStudent = (studid) => {
  return new Promise((resolve, reject) => {
    pool.query(
      `SELECT * FROM tblstudents WHERE studid=?`,
      [studid],
      (err, results) => {
        if (err) {
          return reject(err);
        }
        return resolve(results[0]);
      }
    );
  });
};

// Fetching all student records from our table
const fetchStudents = () => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT * FROM tblstudents`, (err, results) => {
      if (err) {
        return reject(err);
      }
      return resolve(results);
    });
  });
};

// Inserting one student
const insertStudent = ({ studid, fname, lname, level, course, address }) => {
  return new Promise((resolve, reject) => {
    pool.query(
      `INSERT INTO tblstudents 
      (studid, fname, lname, level, course, address, date_enrolled) 
      VALUES (?, ?, ?, ?, ?, ?, NOW())`,
      [studid, fname, lname, level, course, address],
      (err, results) => {
        if (err) {
          return reject(false);
        }
        return resolve(true);
      }
    );
  });
};

// Updating student based on their studentID
const updateStudent = ({
  fname,
  lname,
  level,
  course,
  address,
  status,
  studid,
}) => {
  return new Promise((resolve, reject) => {
    pool.query(
      `UPDATE tblstudents 
      SET fname=?, lname=?, level=?, course=?, address=?, status=? 
      WHERE studid=?`,
      [fname, lname, level, course, address, status, studid],
      (err, results) => {
        if (err) {
          return reject(false);
        }
        return resolve(true);
      }
    );
  });
};

// Checking student if exists in our database using student ID
const checkStudIfExists = (studid) => {
  return new Promise((resolve, reject) => {
    pool.query(
      `SELECT fname FROM tblstudents WHERE studid=?`,
      [studid],
      (err, results) => {
        if (err) {
          return reject(err);
        }
        return resolve(results[0]);
      }
    );
  });
};

// Deleting specific student in our database using student id
const deleteStudent = (studid) => {
  return new Promise((resolve, reject) => {
    pool.query(
      `DELETE FROM tblstudents WHERE studid=?`,
      [studid],
      (err, results) => {
        if (err) {
          return reject(false);
        }
        return resolve(true);
      }
    );
  });
};

module.exports = {
  deleteStudent,
  checkStudIfExists,
  insertStudent,
  fetchStudents,
  fetchOneStudent,
  updateStudent,
};
