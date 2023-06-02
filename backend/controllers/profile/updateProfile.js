//! example appointment http://localhost:3000/profile/update/{patientId}

const connection = require("../../config/dbconnection");
const updateProfile = (req, res) => {
  const profileId = req.userId;
  const role = req.role;
  const { attribute, value } = req.body;

  if (!role || !profileId || !attribute) {
    return res.status(400).json({ error: "Missing required fields " });
  }

  const query = `UPDATE ${role} SET ${attribute} = ? WHERE id = ?`;
  connection.query(
    query,
    [value, Number(profileId)],
    (error, results, fields) => {
      if (error) {
        console.error(error);
        res.status(500).json({ error: "Error updating profile" });
      } else {
        const query = `SELECT * FROM ${role} WHERE id = '${profileId}'`;
        connection.query(query, async (err, result) => {
          if (err) {
            return res.status(400).json({ error: err.message });
          }
          const user = { ...result[0], role: req.role, token: req.token };
          console.log(user);
          return res.status(200).json(user);
        });
      }
    }
  );
};

module.exports = { updateProfile };
