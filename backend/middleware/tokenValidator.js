const tokenValidator = async (req, res) => {
  try {
    const token = req.header("auth-token");
    if (!token) return res.json(false);

    const verified = jwt.verify(token, "secret-token-key");
    if (!verified) return res.json(false);

    const userId = verified.id;
    const query = `SELECT * FROM account WHERE id = '${userId}'`;
    connection.query(query, async (err, result) => {
      if (err) {
        throw err;
      }

      if (!result[0]) return res.json(false);
    });
    return res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = { tokenValidator };
