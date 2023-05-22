//! example api http://localhost:3000/appointment/doctor/{here is doctorid}/appointments?status={here is status pending,rejected,accepted}}

const connection = require("../../config/dbconnection");

const getAppointmentsByDoctor = (req, res) => {
  const doctorId = req.params.doctorId;
  const status = req.query.status;

  if (!status) {
    return res.status(400).send("Missing required fields");
  }

  const query = "SELECT * FROM appointments WHERE doctor_id = ? and status=?";
  connection.query(query, [doctorId, status], (error, results, fields) => {
    if (error) {
      console.error(error);
      res.status(500).send("Error fetching appointments");
    } else {
      res.status(200).send(results);
    }
  });
};

module.exports = { getAppointmentsByDoctor };
