const jwt = require("jsonwebtoken");

const authorized = async (req, res, next) => {
  try {
    const token = req.header("auth-token");
    if (!token)
      return res
        .status(401)
        .json({ error: "No auth token found, access denied" });

    const verified = jwt.verify(token, "secret-token-key");
    if (!verified)
      return res
        .status(401)
        .json({ error: "Token verification failed, authentication failed!" });

    req.userId = verified.id;
    req.role = verified.role;
    req.token = token;

    next();
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
};


module.exports = { authorized };

