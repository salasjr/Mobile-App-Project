//! example api http://localhost:3000/profile/{profileId}

const connection = require("../../config/dbconnection");

const deleteAccount = (req, res) => {
  try {
    const profileId = req.params.profileId;
    const role = req.role;

    // const { role2 } = req.body.role;

    console.log("-------body", role, profileId);
    if (!profileId || !role) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    const query = "Delete from account WHERE id = ?";
    connection.query(query, [profileId], (error, results, fields) => {
      if (error) {
        return res.status(500).json("Error deleting account");
      }

      res.status(204).json({ msg: "Account Deleted successfully" });
    });
    // });
  } catch (error) {
    res.status(500).json({ error: "Error canceling appointment" });
  }
};

module.exports = { deleteAccount };
