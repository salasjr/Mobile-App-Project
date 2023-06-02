//! example http://localhost:3000/profile/update/chnagepassword/{patientId}

const bcryptjs = require("bcryptjs");
const connection = require("../../config/dbconnection");

const changePassword = async (req, res) => {
  try {
    console.log("----------------", req.body);
    const profileId = req.params.profileId;
    const { oldPassword, newPassword } = req.body;

    if (!oldPassword || !newPassword || !profileId) {
      return res
        .status(400)
        .json({ error: "Missing required fields to change password" });
    }

    // const query = `SELECT * FROM account WHERE id = '${profileId}'`;
    // connection.query(query, async (err, result) => {
    //   if (err) {
    //     return res.status(500).json({ error: "Error changing password" });

    //   }

    //   if (!result[0]) {
    //     return res.status(400).json({ error: "Phone number doesn't exists" });
    //   }

    //   const isMatch = await bcryptjs.compare(oldPassword, result[0].password);

    //   if (!isMatch) {
    //     return res.status(400).json({ error: "Incorrect password" });
    //   }})

    const query1 = "SELECT password FROM account WHERE id = ?";
    connection.query(query1, [profileId], async (error, result, fields) => {
      if (error) {
        console.error(error);
        return res.status(500).json({ error: "Error changing password" });
      }
      //   const oldGivenHash = await bcryptjs.hash(oldPassword, 8);

      const isMatch = await bcryptjs.compare(oldPassword, result[0].password);

      if (!isMatch) {
        res.status(400).json({ error: "Incorrect password" });

        return;
      }

      const query = ` UPDATE account SET password = ? WHERE id = ?`;

      const newPassHash = await bcryptjs.hash(newPassword, 8);
      connection.query(
        query,
        [newPassHash, profileId],
        (error, results, fields) => {
          if (error) {
            console.error(error);
            res.status(500).json({ error: "Error Changing password" });
            return;
          } else {
            res.status(200).json({ msg: "password updated successfully" });
            return;
          }
        }
      );
    });
  } catch (error) {
    res.status(500).json({ error: "Error Changing password" });
  }
};

module.exports = { changePassword };
