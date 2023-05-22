//! example api http://localhost:3000/appointment/createappointment/
/*
!example body   
{
    "patientId": 7,
    "doctorId": 55,
    "caseDescription": "new case"
}
*/

const connection = require("../../config/dbconnection");

const createAppointment = (req, res) => {
  const { patientId, doctorId, caseDescription } = req.body;
  const status = "pending";
  const message = "";

  if (!patientId || !doctorId || !caseDescription) {
    return res.status(400).send("Missing required fields");
  }

  const query =
    "INSERT INTO appointments (patient_id, doctor_id, case_description, status, message) VALUES (?, ?, ?, ?, ?);";
  connection.query(
    query,
    [patientId, doctorId, caseDescription, status, message],
    (error, results, fields) => {
      if (error) {
        console.error(error);
        res.status(500).json({ error: "Error setting appointment" });
      } else {
        res.status(201).json({ msg: "Appointment set successfully" });
      }
    }
  );
};

module.exports = {
  createAppointment,
};
