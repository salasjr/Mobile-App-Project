//! example api  http://localhost:3000/user/getAllDoctors

const connection = require("../../config/dbconnection");

const getServiceById = async (req, res) => {
  const id = req.header("id");
  console.log("----", id);
  try {
    const query = `SELECT * FROM service WHERE doctor_id = '${id}'`;
    connection.query(query, async (err, result) => {
      if (err) {
        throw err;
      }
      console.log(result);
      return res.status(200).json(result);
    });
  } catch (e) {
    return res.status(404).json({ error: "data not found" });
  }
};

const addService = async (req, res) => {
  console.log(req.body)
  const { doctor_id, title, description, price } = req.body;

  try {
    const query = `INSERT INTO service (doctor_id, title, description, price) VALUES ("${doctor_id}", "${title}","${description}","${price}")`;
    connection.query(query, async (err, result) => {
      if (err) {
        throw err;
      }
      return res.status(200).json(true);
    });
  } catch (e) {
    return res.status(404).json({ error: "data not found" });
  }
};

const updateService = async (req, res) => {
  const { id, title, description, price } = req.body;

  try {
    const query = `UPDATE service SET title = ?, description = ?, price = ?  WHERE id = ?`;
    connection.query(
      query,
      [title, description, price, id],
      async (err, result) => {
        if (err) {
          throw err;
        }
        return res.status(200).json(true);
      }
    );
  } catch (e) {
    return res.status(404).json({ error: "data not found" });
  }
};

const deleteService = async (req, res) => {
  const id = req.header("id");
  try {
    const query = `DELETE FROM service WHERE id = ?`;
    connection.query(query, [Number(id)], async (err, result) => {
      if (err) {
        throw err;
      }
      return res.status(204).json(true);
    });
  } catch (e) {
    return res.status(404).json({ error: "data not found" });
  }
};

module.exports = { getServiceById, addService, updateService, deleteService };
