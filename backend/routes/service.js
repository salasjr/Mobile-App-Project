const express = require("express");
const serviceRouter = express.Router();
const {
  getServiceById,
  addService,
  updateService,
  deleteService,
} = require("../controllers/services/service");
const { authorized } = require("../middleware/auth");
//! const { tokenValidator } = require("../middleware/tokenValidator");

// user signup
serviceRouter.get("/getservicebyid", getServiceById);
serviceRouter.post("/addService", addService);
serviceRouter.put("/updateService", updateService);
serviceRouter.delete("/deleteService", deleteService);

module.exports = serviceRouter;
