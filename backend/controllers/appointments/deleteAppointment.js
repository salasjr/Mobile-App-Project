//! example api http://localhost:3000/appointment/cancel/{apppointmentid}

const connection = require("../../config/dbconnection");

const cancelAppointment = (req, res) => {
  try {
    const appointmentId = req.params.appointmentId;

    if (!appointmentId) {
      return res.status(400).send("Missing required fields");
    }

    const query = "Delete from appointments WHERE appointment_id = ?";
    connection.query(query, [appointmentId], (error, results, fields) => {
      if (error) {
        console.error(error);
        res.status(500).json("Error canceling appointment");
      } else {
        res.status(200).send("Appointment canceled successfully");
      }
    });
  } catch (error) {
    res.status(500).json("Error canceling appointment");
  }
};

module.exports = { cancelAppointment };
