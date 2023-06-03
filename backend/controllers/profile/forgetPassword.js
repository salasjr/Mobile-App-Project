const forgetPassword = async (req, res) => {
  try {
    const { phoneNumber, newPassword, question, answer } = req.body;

    if (!phoneNumber || !question || !answer) {
      res
        .status(400)
        .json({ error: "missing required fields for forget password" });
    }

    //! match answer and ans

    const query1 =
      "SELECT phoneNumber,question , answer from account where  phoneNumber= ?";

    connection.query(query1, [phoneNumber], async (err, result) => {
      if (err) {
        res
          .status(500)
          .json({ error: "the is server error in forgetting password" });
      }

      if (
        result[0].phoneNumber != phoneNumber ||
        result[0].question !== question ||
        result[0].answer !== answer
      ) {
        res
          .status(400)
          .json({ error: "invalid credentials to forget password" });
      }
      const query = `UPDATE account SET password = ? WHERE id = ?`;

      const newPassHash = await bcryptjs.hash(newPassword, 8);
      connection.query(
        query,
        [newPassHash, profileId],
        (error, results, fields) => {
          if (error) {
            console.error(error);
            res.status(500).json({ error: "Error Changing password" });
          } else {
            res.status(200).json({ msg: "password updated successfully" });
          }
        }
      );
    });
  } catch (error) {}
};

module.exports = { forgetPassword };
