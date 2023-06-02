const connection = require("../config/dbconnection");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

//! utilities

const signUpInputValidate = async (req, res) => {
  // console.log("try ------- trying to validate the inputs --------");
  try {
    const { phoneNumber, password, confirmPassword } = req.body;

    if (password != confirmPassword) {
      return res.status(400).json({ error: "Passwords do not match" });
    }

    const phoneRegex = /^\+2519\d{8}$/;
    const regularPhoneNumber = "+251" + phoneNumber;
    const validPhoneNumber = phoneRegex.test(regularPhoneNumber);

    if (!validPhoneNumber) {
      return res.status(400).json({ error: "Invalid phone number" });
    }

    const query = `SELECT * FROM account WHERE phoneNumber = '${phoneNumber}'`;
    connection.query(query, async (err, rows) => {
      if (err) {
        throw err;
      }
      if (rows.length != 0) {
        return res.status(400).json({ error: "Phone number already exists" });
      }

      return res.status(200).json({ msg: "Success" });
    });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
};

const signUp = async (req, response) => {
  try {
    const {
      fullName,
      phoneNumber,
      password,
      businessName,
      businessId,
      address,
      question,
      answer,
      role,
    } = req.body;

    const { filename, mimetype, size } = req.file;

    const userInfo = {
      fullName: fullName,
      phoneNumber: phoneNumber,
      businessName: businessName,
      businessId: businessId,
      address: address,
      role: role,
      profilePicture: filename,
    };

    // Hash password
    const hashedPassword = await bcryptjs.hash(password, 8);
    const query1 = `INSERT INTO account (phoneNumber, password, question, answer, role) VALUES ("${phoneNumber}","${hashedPassword}","${question}","${answer}","${role}")`;

    // Insert the user into account table

    connection.query(query1, (err, result) => {
      if (err) {
        throw new Error("q1 failed");
      }
  
    });

    // Get the user id from account table by phone number

    const query2 = `SELECT id FROM account WHERE phoneNumber = '${phoneNumber}'`;
    connection.query(query2, (err, res) => {
      if (err) {
        throw new Error("q2 failed");
      }

      const id = res[0].id;
      userInfo.id = id;
      let query3 = "";

      if (role == "doctor") {
        query3 = `INSERT INTO doctor (id, fullName, businessName, businessId, address, phoneNumber, profilePicture) VALUES ('${id}', '${fullName}', '${businessName}', '${businessId}', '${address}', '${phoneNumber}', '${filename}')`;
      } else {
        query3 = `INSERT INTO patient (id, fullName, address, phoneNumber, profilePicture) VALUES ('${id}', '${fullName}', '${address}', '${phoneNumber}', '${filename}')`;
      }

      connection.query(query3, (err, res) => {
        if (err) {
          throw new Error("q3 failed");
          return response.status(500).json({ error: "user already exists" });
        }
      });

      // Call the uploadImage function to handle the file upload

      const payload = { id: id, role: role };
      const token = jwt.sign(payload, "secret-token-key");

      return response.status(200).json({ ...userInfo, token: token });
    });
  } catch (e) {
    return response.status(500).json({ error: e.message });
  }
};

const signIn = async (req, res) => {
  try {
    const { phoneNumber, password } = req.body;

    const phoneRegex = /^\+2519\d{8}$/;
    const validNumber = "+251" + phoneNumber;
    const validPhoneNumber = phoneRegex.test(validNumber);
    if (!validPhoneNumber) {
      return res.status(400).json({ error: "Invalid phone number" });
    }

    const query = `SELECT * FROM account WHERE phoneNumber = '${phoneNumber}'`;
    connection.query(query, async (err, result) => {
      if (err) {
        throw err;
      }

      if (!result[0]) {
        return res.status(400).json({ error: "Phone number doesn't exists" });
      }

      const isMatch = await bcryptjs.compare(password, result[0].password);

      if (!isMatch) {
        return res.status(400).json({ error: "Incorrect password" });
      }

      const payload = { id: result[0].id, role: result[0].role };
      const token = jwt.sign(payload, "secret-token-key");

      // Fetch user data from perspective table of their role
      const query1 = `SELECT * FROM ${result[0].role} WHERE id = '${result[0].id}'`;

      connection.query(query1, (err, row) => {
        if (err) throw err;

        const response = { ...row[0], role: result[0].role, token: token };
        return res.status(200).json(response);
      });
    });
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
};

module.exports = {
  signIn,
  signUp,
  signUpInputValidate,
};
