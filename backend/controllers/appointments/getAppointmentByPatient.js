//! example api http://localhost:3000/appointment/patient/appointmentid

const connection = require("../../config/dbconnection");

const getAppointmentsByPatient = (req, res) => {
  const patientId = req.params.patientId;

  const query = "SELECT * FROM appointments WHERE patient_id = ?";
  connection.query(query, [patientId], (error, results, fields) => {
    if (error) {
      console.error(error);
      res.status(500).send("Error fetching appointments");
    } else {
      res.status(200).send(results);
    }
  });
};

module.exports = { getAppointmentsByPatient };
