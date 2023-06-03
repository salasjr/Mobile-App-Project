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
      let n = results.length;
      let counter = 0;

      for (let i = 0; i < n; i++) {
        let doctor_id = results[i]["doctor_id"];
        let newQuery = "SELECT * FROM doctor WHERE id = ?";

        connection.query(newQuery, [doctor_id], (error, row) => {
          if (error) {
            console.error(error);
            res.status(500).send("Error fetching doctor details");
          } else {
            results[i]["fullname"] = row[0]["fullname"];
            results[i]["phoneNumber"] = row[0]["phoneNumber"];
            results[i]["profilePicture"] = row[0]["profilePicture"];
            results[i]["address"] = row[0]["address"];

            counter++;
            if (counter === n) {
              // All doctor details have been fetched
              console.log("Appointments:", results);
              res.status(200).send(results);
            }
          }
        });
      }
    }
  });
};

module.exports = { getAppointmentsByPatient };
