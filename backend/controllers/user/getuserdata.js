const connection = require("../../config/dbconnection");

const getUserData = async (req, res) => {

  console.log("----------------- getuserData")
  try {
    const { role, userId } = req;

    if (!role || !userId) {
      res.status(400).json({
        error: "Missing required fields",
      });
    }

    const query = `SELECT * FROM ${role} WHERE id = '${userId}'`;
    connection.query(query, async (err, result) => {
      if (err) {
        throw err;
      }
      const user = { ...result[0], role: req.role, token: req.token };
      // console.log("====  hello I am here ======", user);
      return res.status(200).json(user);
    });
  } catch (e) {
    return res.status(404).json({ error: "user not found" });
  }
};

module.exports = { getUserData };
