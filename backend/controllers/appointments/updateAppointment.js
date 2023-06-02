//! example appointment http://localhost:3000/appointment/update/{appointmentid}
/*
!example body
{
"status":"rejected",
"message":"altemechegnm"
} 
*/

const connection = require("../../config/dbconnection");
const updateAppointmentStatus = (req, res) => {
  const appointmentId = req.params.appointmentId;
  const { status, message } = req.body;

  if (!status || !message) {
    return res.status(400).send("Missing required fields");
  }

  const query =
    "UPDATE appointments SET status = ?, message = ? WHERE appointment_id = ?";
  connection.query(
    query,
    [status, message, appointmentId],
    (error, results, fields) => {
      if (error) {
        console.error(error);
        res.status(500).json({ error: "Error updating appointment" });
      } else {
        res.status(200).json({ msg: "Appointment updated successfully" });
      }
    }
  );
};

module.exports = { updateAppointmentStatus };
