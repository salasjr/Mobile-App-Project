const connection = require("../../config/dbconnection");

const rateAppointment = (req, res) => {
  try {
    const appointmentId = req.params.appointmentId;
    const { value, doctorId } = req.body;

    if (!appointmentId || !value) {
      res.status(400).json({
        error: "invalid value for required field value",
      });
    }

    if (value <= 0 || value > 5) {
      return res.status(400).json({ error: "Missing required fields" });
    }
    const query = "UPDATE appointments SET rating = ? WHERE appointment_id = ?";
    connection.query(
      query,
      [value, appointmentId],
      (error, results, fields) => {
        if (error) {
          res.status(500).json({ error: "Error updating appointments rating" });
        } else {
          const query2 = `UPDATE doctor SET rating=rating+${value} ,rating_count = rating_count +1 WHERE id = ?`;
          connection.query(query2, [doctorId], (err, result) => {
            if (err) {
              throw err;
            }
            res.status(200).json({ msg: "Appointment updated successfully" });
          });
        }
      }
    );
  } catch (error) {
    res.status(500).json({ error: "Error updating appointments rating" });
  }
};

module.exports = { rateAppointment };
