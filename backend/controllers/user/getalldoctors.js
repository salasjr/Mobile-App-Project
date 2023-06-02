//! example api  http://localhost:3000/user/getAllDoctors

const connection = require("../../config/dbconnection");

const getAllDoctors = async (req, res) => {
  try {
    const query = `SELECT * FROM doctor`;
    connection.query(query, async (err, result) => {
      if (err) {
        throw err;
      } 

      // console.log("====  hello I am here ======", user);
      return res.status(200).json(result);
    });
  } catch (e) {
    return res.status(404).json({ error: "data not found" });
  }
};

module.exports = { getAllDoctors };
