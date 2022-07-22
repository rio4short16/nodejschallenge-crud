const express = require("express");
const app = express();
const {
  insertStudent,
  fetchStudents,
  checkStudIfExists,
  deleteStudent,
  fetchOneStudent,
  updateStudent,
} = require("./services/homeServices");

// Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Main Routes
app.get("/students", async (req, res) => {
  const fetchedAllStud = await fetchStudents();
  if (fetchedAllStud?.length > 0) {
    res.status(200).json(fetchedAllStud);
  }
});

app.get("/student/:id", async (req, res) => {
  const fetchedStud = await fetchOneStudent(req.params.id);
  if (fetchedStud == null || fetchedStud == undefined) {
    return res.status(500).json({ result: false, msg: "No records found." });
  }
  res.status(200).json(fetchedStud);
});

app.post("/insert", async (req, res) => {
  const checkIfExists = await checkStudIfExists(req.body.studid);
  if (checkIfExists != null || checkIfExists != undefined) {
    return res.status(400).json({
      result: false,
      msg: "Student ID is already exists!",
    });
  }

  const registeredUser = await insertStudent(req.body);
  if (!registeredUser)
    return res.status(400).json({
      result: registeredUser,
      msg: "Something went wrong!",
    });
  res.status(200).json({
    result: registeredUser,
    msg: "Student has been inserted successfully!",
  });
});

app.patch("/update", async (req, res) => {
  const updatedUser = await updateStudent(req.body);
  if (!updatedUser)
    return res.status(400).json({
      result: updatedUser,
      msg: "Something went wrong!",
    });
  res.status(200).json({
    result: updatedUser,
    msg: "Student has been updated successfully!",
  });
});

app.delete("/delete", async (req, res) => {
  const deletedStudent = await deleteStudent(req.body.studid);
  if (!deletedStudent) {
    return res.status(400).json({
      result: false,
      msg: "Something went wrong!",
    });
  }
  res.status(200).json({
    result: true,
    msg: "Student has been deleted successfully!",
  });
});

app.get("*", (req, res) => {
  res.send("Error 404: Unknown route!");
});

const PORT = process.env.PORT || 3001;

app.listen(PORT, () => {
  console.log(`Listening to port: ${PORT}`);
});
