//! example api http://localhost:3000/appointment/doctor/{here is doctorid}/appointments?status={here is status pending,rejected,accepted}}

const connection = require("../../config/dbconnection");

const getAppointmentsByDoctor = (req, res) => {
  const doctorId = req.params.doctorId;

  const query = "SELECT * FROM appointments WHERE doctor_id = ?";
  connection.query(query, [doctorId], (error, results, fields) => {
    if (error) {
      console.error(error);
      res.status(500).send("Error fetching appointments");
    } else {
      let n = results.length;
      let counter = 0;

      for (let i = 0; i < n; i++) {
        let patient_id = results[i]["patient_id"];
        let newQuery = "SELECT * FROM patient WHERE id = ?";

        connection.query(newQuery, [patient_id], (error, row) => {
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
              res.status(200).send(results);
            }
          }
        });
      }
    }
  });
};

module.exports = { getAppointmentsByDoctor };
