//! example api http://localhost:3000/appointment/mark/{appointmentid}
/*
!example body 
{
"status":"completed"
} 
*/

const connection = require("../../config/dbconnection");

const markAppointmentDoneUnDone = (req, res) => {
  try {
    const appointmentId = req.params.appointmentId;
    const { status } = req.body;

    if (!status || !appointmentId) {
      return res.status(400).send("Missing required fields");
    }

    const query = "UPDATE appointments SET status = ? WHERE appointment_id = ?";
    connection.query(
      query,
      [status, appointmentId],
      (error, results, fields) => {
        if (error) {
          console.error(error);
          res.status(500).json("Error updating appointment");
        } else {
          res.status(200).send("Appointment updated successfully");
        }
      }
    );
  } catch (error) {}
};

module.exports = { markAppointmentDoneUnDone };
